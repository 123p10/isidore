#include "code_gen.h"
#include "../AST/ASTTree.h"
#include "llvm/Transforms/InstCombine/InstCombine.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Scalar/GVN.h"
#include "llvm/Support/TargetSelect.h"
#include "clang/AST/Type.h"
#include "llvm/Transforms/Utils.h"
llvm::Value *LogErrorV(const char *Str){
    LogError(Str);
    return nullptr;
}
CodeGenerator::CodeGenerator(){
    initPrecedence();
    llvm::InitializeNativeTarget();
    llvm::InitializeNativeTargetAsmPrinter();
    llvm::InitializeNativeTargetAsmParser();
    TheContext = new llvm::LLVMContext();
    Builder = new llvm::IRBuilder<>(*TheContext);
    TheJIT = new std::unique_ptr<llvm::orc::KaleidoscopeJIT>;
    *TheJIT = llvm::make_unique<llvm::orc::KaleidoscopeJIT>();
    FunctionProtos = new std::map<std::string, std::unique_ptr<PrototypeAST>>;
    InitializeModuleAndPassManager();
}
void CodeGenerator::initPrecedence(){
    BinopPrecedence["="] = 2;
    BinopPrecedence["+="] = 2;
    BinopPrecedence["-="] = 2;
    BinopPrecedence["*="] = 2;
    BinopPrecedence["/="] = 2;
    BinopPrecedence["&&"] = 5;
    BinopPrecedence["||"] = 5;
    BinopPrecedence["<"] = 10;
    BinopPrecedence[">"] = 10;
    BinopPrecedence["=="] = 10;
    BinopPrecedence[">="] = 10;
    BinopPrecedence["<="] = 10;
    BinopPrecedence["!="] = 10;
    BinopPrecedence["+"] = 20;
    BinopPrecedence["-"] = 20;
    BinopPrecedence["%"] = 40; // highest.
    BinopPrecedence["/"] = 40; // highest.
    BinopPrecedence["*"] = 40; // highest.
}
CodeGenerator::~CodeGenerator(){
    delete TheContext;
    delete Builder;
    delete TheModule;
    delete TheFPM;
    delete TheJIT;
    delete FunctionProtos;
}
void CodeGenerator::InitializeModuleAndPassManager(){
    TheModule = new std::unique_ptr<llvm::Module>;
    *TheModule = llvm::make_unique<llvm::Module>("my cool jit", *TheContext);
    TheModule->get()->setDataLayout(TheJIT->get()->getTargetMachine().createDataLayout());
    TheFPM = new std::unique_ptr<llvm::legacy::FunctionPassManager>;
    *TheFPM = llvm::make_unique<llvm::legacy::FunctionPassManager>(TheModule->get());
    if(false){
        TheFPM->get()->add(llvm::createPromoteMemoryToRegisterPass());
        TheFPM->get()->add(llvm::createInstructionCombiningPass());
        TheFPM->get()->add(llvm::createReassociatePass());
        TheFPM->get()->add(llvm::createGVNPass());
        TheFPM->get()->add(llvm::createCFGSimplificationPass());
    }
    TheFPM->get()->doInitialization();
}
llvm::Function *CodeGenerator::getFunction(std::string Name){
    if(auto *F = TheModule->get()->getFunction(Name)){
        return F;
    }
    
    auto FI = FunctionProtos->find(Name);
    if(FI != FunctionProtos->end()){
        return FI->second->codegen();
    }
    return nullptr;
}
llvm::Value * CodeGenerator::castToType(llvm::Value *value, llvm::Type * type){
    if(type == value->getType()){
        return value;
    }
    if(value->getType()->isIntegerTy()){
        if(type->isFloatingPointTy()){
            return Builder->CreateSIToFP(value,type);
        }
    }
    else if(value->getType()->isFloatingPointTy()){
        if(type->isIntegerTy()){
            return Builder->CreateFPToSI(value,type);
        }
    }
    return value;

}

llvm::AllocaInst *CodeGenerator::CreateEntryBlockAlloca(llvm::Function *TheFunction, llvm::Type * type, const std::string &VarName){
    llvm::IRBuilder<> TmpB(&TheFunction->getEntryBlock(), TheFunction->getEntryBlock().begin());
    return TmpB.CreateAlloca(type,0,VarName.c_str());
}
