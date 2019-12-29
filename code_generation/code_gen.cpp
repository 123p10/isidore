#include "code_gen.h"
#include "../AST/ASTTree.h"
#include "llvm/Transforms/InstCombine/InstCombine.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Scalar/GVN.h"
#include "llvm/Support/TargetSelect.h"
#include "clang/AST/Type.h"
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
    BinopPrecedence["<"] = 10;
    BinopPrecedence["+"] = 20;
    BinopPrecedence["-"] = 20;
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
void CodeGenerator::InitializeModuleAndPassManager(void){
    TheModule = new std::unique_ptr<llvm::Module>;
    *TheModule = llvm::make_unique<llvm::Module>("my cool jit", *TheContext);
    TheModule->get()->setDataLayout(TheJIT->get()->getTargetMachine().createDataLayout());
    TheFPM = new std::unique_ptr<llvm::legacy::FunctionPassManager>;
    *TheFPM = llvm::make_unique<llvm::legacy::FunctionPassManager>(TheModule->get());
    TheFPM->get()->add(llvm::createInstructionCombiningPass());
    TheFPM->get()->add(llvm::createReassociatePass());
    TheFPM->get()->add(llvm::createGVNPass());
    TheFPM->get()->add(llvm::createCFGSimplificationPass());
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