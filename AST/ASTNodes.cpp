#include "ASTNodes.h"
#include "llvm/IR/Constants.h"
#include "llvm/ADT/APFloat.h"
#include <iostream>
#include "llvm/IR/Type.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Verifier.h"
#include "../code_generation/code_gen.h"
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
    return V;
}
llvm::Value *BinaryExprAST::codegen() {
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
    else if(Op == "<"){
        L = code_gen->Builder->CreateFCmpULT(L,R,"cmptmp");
        return code_gen->Builder->CreateUIToFP(L,llvm::Type::getDoubleTy(*(code_gen->TheContext)),"booltmp");
    }
    else{
        return LogErrorV("Invalid Binary Operator");
    }
}
llvm::Value *CallExprAST::codegen(){
    llvm::Function *CalleeF = code_gen->TheModule->get()->getFunction(Callee);
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
    llvm::Function *TheFunction = code_gen->TheModule->get()->getFunction(Proto->getName());
    if(!TheFunction){
        TheFunction = Proto->codegen();
    }
    if(!TheFunction){
        return nullptr;
    }
/*     if (!TheFunction->empty())
        return (llvm::Function*)LogErrorV("Function cannot be redefined.");
 */    
    llvm::BasicBlock *BB = llvm::BasicBlock::Create(*(code_gen->TheContext),"entry",TheFunction);
    code_gen->Builder->SetInsertPoint(BB);

    code_gen->NamedValues.clear();
    for(auto &Arg : TheFunction->args()){
        code_gen->NamedValues[Arg.getName()] = &Arg;
    }
    if(llvm::Value *RetVal = Body->codegen()){
        code_gen->Builder->CreateRet(RetVal);
        llvm::verifyFunction(*TheFunction);
        code_gen->TheFPM->get()->run(*TheFunction);
        return TheFunction;
    }
    TheFunction->eraseFromParent();
    return nullptr;
}

