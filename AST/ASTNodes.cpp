#include "ASTNodes.h"
#include "llvm/IR/Constants.h"
#include "llvm/ADT/APFloat.h"
#include <iostream>
#include "llvm/IR/Type.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Verifier.h"
#include "../code_generation/code_gen.h"
#include "ASTTree.h"
NumberExprAST::NumberExprAST(std::string numString, CodeGenerator * code_gen){
    Val = stod(numString);
    (*this).code_gen = code_gen;
}

VariableExprAST::VariableExprAST(const std::string &Name, CodeGenerator * code_gen){
    (*this).Name = Name;
    (*this).code_gen = code_gen;
}
BinaryExprAST::BinaryExprAST(std::string op, std::unique_ptr<ExprAST> LHS, std::unique_ptr<ExprAST> RHS, CodeGenerator * code_gen){
    Op = op;
    (*this).LHS = std::move(LHS);
    (*this).RHS = std::move(RHS);
    (*this).code_gen = code_gen;
}
IfExprAST::IfExprAST(std::unique_ptr<ExprAST> Cond,std::vector<std::unique_ptr<ExprAST>> Then, std::vector<std::unique_ptr<ExprAST>> ElseThen, CodeGenerator * code_gen){
    (*this).Cond = std::move(Cond);
    (*this).ThenList = std::move(Then);
    (*this).ElseThenList = std::move(ElseThen);
    (*this).code_gen = code_gen;
}
ReturnExprAST::ReturnExprAST(std::unique_ptr<ExprAST> returnExpr,CodeGenerator * code_gen){
    (*this).returnExpr = std::move(returnExpr);
    (*this).code_gen = code_gen;
    (*this).isReturn = true;
}

FunctionAST::FunctionAST(std::unique_ptr<PrototypeAST> Proto,
              std::vector<std::unique_ptr<ExprAST>> Body, CodeGenerator * code_gen){
    (*this).Proto = std::move(Proto);
    (*this).Body = std::move(Body);
    (*this).code_gen = code_gen;
}
//Code_gen
//To improve this remove these persistent references to getContext or getModule, replace with temp variables or better method, pointers
llvm::Value *NumberExprAST::codegen(){
    return llvm::ConstantFP::get(*(code_gen->TheContext),llvm::APFloat(Val));
}
llvm::Value *VariableExprAST::codegen(){
    llvm::Value *V = code_gen->NamedValues[Name];
    if(!V){
        LogErrorV("Unknown Variable Name");
    }
    return code_gen->Builder->CreateLoad(V,Name.c_str());
}
llvm::Value *UnaryExprAST::codegen(){
    llvm::Value *OperandV = Operand->codegen();
    if(!OperandV){
        return nullptr;
    }
    llvm::Function *F = code_gen->getFunction(std::string("unary") + Opcode);
    if(!F){
        return LogErrorV("Unknown unary operator");
    }
    return code_gen->Builder->CreateCall(F,OperandV,"unop");
}
llvm::Value *BinaryExprAST::codegen() {
    if(Op == "="){
        VariableExprAST *LHSE = dynamic_cast<VariableExprAST*>(LHS.get());
        if(!LHSE){
            return LogErrorV("destination of '=' must be a variable");
        }
        llvm::Value *Val = RHS->codegen();
        if(!Val){
            return nullptr;
        }
        llvm::Value *Variable = code_gen->NamedValues[LHSE->getName()];
        if(!Variable){
            return LogErrorV("Unknown Variable name");
        }
        code_gen->Builder->CreateStore(Val, Variable);
        return Val;
    }
    llvm::Value *L = LHS->codegen();
    llvm::Value *R = RHS->codegen();
    if (!L || !R)
        return nullptr;
    if(Op == "+"){
        return code_gen->Builder->CreateFAdd(L,R, "addtmp");
    }
    else if(Op == "-"){
        return code_gen->Builder->CreateFSub(L,R, "subtmp");
    }
    else if(Op == "*"){
        return code_gen->Builder->CreateFMul(L,R, "multmp");
    }
    //Implement > operator using userdefined operators
    else if(Op == "<"){
        L = code_gen->Builder->CreateFCmpULT(L,R,"cmptmp");
        return code_gen->Builder->CreateUIToFP(L,llvm::Type::getDoubleTy(*(code_gen->TheContext)),"booltmp");
    }
    else{
        llvm::Function *F = code_gen->getFunction(std::string("binary") + Op);
        assert(F && "binary operator not found!");
        llvm::Value *Ops[2] = {L, R};
        return code_gen->Builder->CreateCall(F,Ops,"binop");
    }
}
llvm::Value *CallExprAST::codegen(){
    llvm::Function *CalleeF = code_gen->getFunction(Callee);
    if(!CalleeF){
        return LogErrorV("Unknown Function Referenced");
    }
    if(CalleeF->arg_size() != Args.size()){
        return LogErrorV("Incorrect # of arguments passed");
    }
    std::vector<llvm::Value *> ArgsV;
    for(unsigned i = 0, e = Args.size(); i != e;++i){
        ArgsV.push_back(Args[i]->codegen());
        if(!ArgsV.back()){
            return nullptr;
        }
    }
    return code_gen->Builder->CreateCall(CalleeF,ArgsV,"calltmp");
}
llvm::Value *IfExprAST::codegen(){
    llvm::Value *CondV = Cond->codegen();
    if(!CondV){
        return nullptr;
    }
    CondV = code_gen->Builder->CreateFCmpONE(CondV, llvm::ConstantFP::get(*code_gen->TheContext,llvm::APFloat(0.0)),"ifcond");
    llvm::Function *TheFunction = code_gen->Builder->GetInsertBlock()->getParent();
    
    llvm::BasicBlock *ThenBB = llvm::BasicBlock::Create(*code_gen->TheContext,"then");
    llvm::BasicBlock *ElseBB = llvm::BasicBlock::Create(*code_gen->TheContext,"else");
    llvm::BasicBlock *MergeBB = llvm::BasicBlock::Create(*code_gen->TheContext,"ifcont");
    TheFunction->getBasicBlockList().push_back(ThenBB);
    code_gen->Builder->CreateCondBr(CondV, ThenBB, ElseBB);
    code_gen->Builder->SetInsertPoint(ThenBB);
    for(std::vector<std::unique_ptr<ExprAST>>::iterator it = ThenList.begin(); it != ThenList.end(); ++it) {
        it->get()->codegen();
    }
    code_gen->Builder->CreateBr(MergeBB);
    ThenBB = code_gen->Builder->GetInsertBlock();
    TheFunction->getBasicBlockList().push_back(ElseBB);
    code_gen->Builder->SetInsertPoint(ElseBB);
    for(std::vector<std::unique_ptr<ExprAST>>::iterator it = ElseThenList.begin(); it != ElseThenList.end(); ++it) {
        it->get()->codegen();    
    }
    code_gen->Builder->CreateBr(MergeBB);
    ElseBB = code_gen->Builder->GetInsertBlock();
    TheFunction->getBasicBlockList().push_back(MergeBB);
    code_gen->Builder->SetInsertPoint(MergeBB);
    return llvm::ConstantFP::get(*(code_gen->TheContext),llvm::APFloat(0.0));
}

llvm::Value *ForExprAST::codegen(){
    llvm::Function *TheFunction = code_gen->Builder->GetInsertBlock()->getParent();
    llvm::AllocaInst *Alloca = code_gen->CreateEntryBlockAlloca(TheFunction,VarName);
    
    llvm::Value *StartVal = Start->codegen();
    if(!StartVal){
        return nullptr;
    }
    code_gen->Builder->CreateStore(StartVal, Alloca);

    llvm::BasicBlock *LoopBB = llvm::BasicBlock::Create(*code_gen->TheContext, "loop", TheFunction);

    code_gen->Builder->CreateBr(LoopBB);

    code_gen->Builder->SetInsertPoint(LoopBB);

    llvm::AllocaInst *OldVal = code_gen->NamedValues[VarName];
    code_gen->NamedValues[VarName] = Alloca;
    if(!Body->codegen()){
        return nullptr;
    }

    llvm::Value *StepVal = nullptr;
    if(Step){
        StepVal = Step->codegen();
        if(!StepVal){
            return nullptr;
        }
    }
    else{
        StepVal = llvm::ConstantFP::get(*code_gen->TheContext,llvm::APFloat(1.0));
    }

    llvm::Value *EndCond = End->codegen();
    if(!EndCond){
        return nullptr;
    }
    llvm::Value *CurVar = code_gen->Builder->CreateLoad(Alloca, VarName.c_str());
    llvm::Value *NextVar = code_gen->Builder->CreateFAdd(CurVar, StepVal, "nextvar");
    code_gen->Builder->CreateStore(NextVar,Alloca);
    EndCond = code_gen->Builder->CreateFCmpONE(EndCond,llvm::ConstantFP::get(*code_gen->TheContext,llvm::APFloat(0.0)),"loopcond");

    llvm::BasicBlock *AfterBB = llvm::BasicBlock::Create(*code_gen->TheContext,"afterloop",TheFunction);
    code_gen->Builder->CreateCondBr(EndCond, LoopBB, AfterBB);
    code_gen->Builder->SetInsertPoint(AfterBB);

    if(OldVal){
        code_gen->NamedValues[VarName] = OldVal;
    }
    else{
        code_gen->NamedValues.erase(VarName);
    }
    return llvm::Constant::getNullValue(llvm::Type::getDoubleTy(*code_gen->TheContext));
}

llvm::Value *VarExprAST::codegen(){
    std::vector<llvm::AllocaInst *> OldBindings;

    llvm::Function *TheFunction = code_gen->Builder->GetInsertBlock()->getParent();
    for(unsigned i = 0, e = VarNames.size(); i != e;++i){
        const std::string &VarName = VarNames[i].first;
        ExprAST *Init = VarNames[i].second.get();

        llvm::Value *InitVal;
        if(Init){
            InitVal = Init->codegen();
            if(!InitVal){
                return nullptr;
            }
        }
        else{
            InitVal = llvm::ConstantFP::get(*code_gen->TheContext,llvm::APFloat(0.0));
        }
        llvm::AllocaInst *Alloca = code_gen->CreateEntryBlockAlloca(TheFunction,VarName);
        code_gen->Builder->CreateStore(InitVal, Alloca);
        OldBindings.push_back(code_gen->NamedValues[VarName]);
        code_gen->NamedValues[VarName] = Alloca;
    }
    llvm::Value *BodyVal = Body->codegen();
    if(!BodyVal){
        return nullptr;
    }
    for(unsigned i = 0, e = VarNames.size();i != e; ++i){
        code_gen->NamedValues[VarNames[i].first] = OldBindings[i];
    }
    return BodyVal;
}


llvm::Function *PrototypeAST::codegen(){
    std::vector<llvm::Type*> Doubles(Args.size(),llvm::Type::getDoubleTy(*(code_gen->TheContext)));
    llvm::FunctionType *FT = llvm::FunctionType::get(llvm::Type::getDoubleTy(*(code_gen->TheContext)),Doubles,false);
    llvm::Function *F = llvm::Function::Create(FT, llvm::Function::ExternalLinkage,Name,code_gen->TheModule->get());
    unsigned Idx = 0;
    for(auto &Arg : F->args()){
        Arg.setName(Args[Idx++]);
    }
    return F;
}

llvm::Function *FunctionAST::codegen(){
    auto &P = *Proto;
    (*(code_gen->FunctionProtos))[Proto->getName()] = std::move(Proto);
    llvm::Function *TheFunction = code_gen->getFunction(P.getName());
    if(!TheFunction){
        return nullptr;
    }
    if(P.isBinaryOp()){
        code_gen->BinopPrecedence[std::string(1,P.getOperatorName())] = P.getBinaryPrecedence();
    }
    llvm::BasicBlock *BB = llvm::BasicBlock::Create(*(code_gen->TheContext),"entry",TheFunction);
    code_gen->Builder->SetInsertPoint(BB);

    code_gen->NamedValues.clear();
    for(auto &Arg : TheFunction->args()){

        llvm::AllocaInst *Alloca = code_gen->CreateEntryBlockAlloca(TheFunction,Arg.getName());
        code_gen->Builder->CreateStore(&Arg,Alloca);
        code_gen->NamedValues[Arg.getName()] = Alloca;
    }
    if(P.getName() == "__anon__expr"){
        llvm::Value *RetVal = Body.at(0)->codegen();
        code_gen->Builder->CreateRet(RetVal);
    }
    else{
        for(std::vector<std::unique_ptr<ExprAST>>::iterator it = Body.begin(); it != Body.end(); ++it) {
            it->get()->codegen();
            if(it->get()->isReturn == true){
                break;
            }
        }
    }
    llvm::verifyFunction(*TheFunction,&llvm::errs());
    code_gen->TheFPM->get()->run(*TheFunction);
    return TheFunction;

}
llvm::Value *ReturnExprAST::codegen(){
    return code_gen->Builder->CreateRet(returnExpr->codegen());
}