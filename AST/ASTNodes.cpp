#include "ASTNodes.h"
#include "llvm/IR/Constants.h"
#include "llvm/ADT/APFloat.h"
#include <iostream>
#include "llvm/IR/Type.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Verifier.h"
#include "../code_generation/code_gen.h"
NumberExprAST::NumberExprAST(std::string numString){
    Val = stod(numString);
}

VariableExprAST::VariableExprAST(const std::string &Name) : Name(Name){}
BinaryExprAST::BinaryExprAST(std::string op, std::unique_ptr<ExprAST> LHS, std::unique_ptr<ExprAST> RHS){
    Op = op;
    (*this).LHS = std::move(LHS);
    (*this).RHS = std::move(RHS);
}
static llvm::LLVMContext TheContext;
static llvm::IRBuilder<> Builder(TheContext);
static std::unique_ptr<llvm::Module> TheModule;
static std::map<std::string, llvm::Value *> NamedValues;
void init(){
      TheModule = llvm::make_unique<llvm::Module>("my cool jit", TheContext);
}

//Code_gen
//To improve this remove these persistent references to getContext or getModule, replace with temp variables or better method, pointers
llvm::Value *NumberExprAST::codegen(){
    return llvm::ConstantFP::get(TheContext,llvm::APFloat(Val));
}
llvm::Value *VariableExprAST::codegen(){
    llvm::Value *V = NamedValues[Name];
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
        return Builder.CreateFAdd(L,R, "addtmp");
    }
    else if(Op == "-"){
        return Builder.CreateFSub(L,R, "subtmp");
    }
    else if(Op == "*"){
        return Builder.CreateFMul(L,R, "multmp");
    }
    else if(Op == "<"){
        L = Builder.CreateFCmpULT(L,R,"cmptmp");
        return Builder.CreateUIToFP(L,llvm::Type::getDoubleTy(TheContext),"booltmp");
    }
    else{
        return LogErrorV("Invalid Binary Operator");
    }
}
llvm::Value *CallExprAST::codegen(){
    llvm::Function *CalleeF = TheModule->getFunction(Callee);
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
    return Builder.CreateCall(CalleeF,ArgsV,"calltmp");
}
llvm::Function *PrototypeAST::codegen(){
    std::vector<llvm::Type*> Doubles(Args.size(),llvm::Type::getDoubleTy(TheContext));
    llvm::FunctionType *FT = llvm::FunctionType::get(llvm::Type::getDoubleTy(TheContext),Doubles,false);
    llvm::Function *F = llvm::Function::Create(FT, llvm::Function::ExternalLinkage,Name,TheModule.get());
    unsigned Idx = 0;
    for(auto &Arg : F->args()){
        Arg.setName(Args[Idx++]);
    }
    return F;
}

llvm::Function *FunctionAST::codegen(){
    llvm::Function *TheFunction = TheModule->getFunction(Proto->getName());
    if(!TheFunction){
        TheFunction = Proto->codegen();
    }
    if(!TheFunction){
        return nullptr;
    }
    if (!TheFunction->empty())
        return (llvm::Function*)LogErrorV("Function cannot be redefined.");
    llvm::BasicBlock *BB = llvm::BasicBlock::Create(TheContext,"entry",TheFunction);
    Builder.SetInsertPoint(BB);

    NamedValues.clear();
    for(auto &Arg : TheFunction->args()){
        NamedValues[Arg.getName()] = &Arg;
    }
    if(llvm::Value *RetVal = Body->codegen()){
        Builder.CreateRet(RetVal);
        llvm::verifyFunction(*TheFunction);
        return TheFunction;
    }
    TheFunction->eraseFromParent();
    return nullptr;
}

