#include "code_gen.h"
#include "../AST/ASTTree.h"
#include "llvm/Transforms/InstCombine/InstCombine.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Transforms/Scalar/GVN.h"
#include "llvm/Support/TargetSelect.h"
#include "clang/AST/Type.h"
#include "llvm/Transforms/Utils.h"
#include "../types/type_manager.h"
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
    typeManager = new TypeManager(TheContext,Builder);

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
    delete typeManager;
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



llvm::AllocaInst *CodeGenerator::CreateEntryBlockAlloca(llvm::Function *TheFunction, llvm::Type * type, const std::string &VarName){
    llvm::IRBuilder<> TmpB(&TheFunction->getEntryBlock(), TheFunction->getEntryBlock().begin());
    return TmpB.CreateAlloca(type,0,VarName.c_str());
}
llvm::Value * CodeGenerator::operator_instructions(std::string instruction, llvm::Value *L, llvm::Value *R){
    llvm::Type * casted_type = typeManager->auto_cast(L,R);
    if(instruction == "Add"){
        if(casted_type->isFloatingPointTy()){
            return Builder->CreateFAdd(L,R, "addtmp");
        }
        else if(casted_type->isIntegerTy()){
            return Builder->CreateAdd(L,R, "addtmp");
        }
    }
    else if(instruction == "Subtract"){
        if(casted_type->isFloatingPointTy()){
            return Builder->CreateFSub(L,R, "subtmp");
        }
        else if(casted_type->isIntegerTy()){
            return Builder->CreateSub(L,R, "subtmp");
        }
    }
    else if(instruction == "Multiply"){
        if(casted_type->isFloatingPointTy()){
            return Builder->CreateFMul(L,R, "multmp");
        }
        else if(casted_type->isIntegerTy()){
            return Builder->CreateMul(L,R, "multmp");
        }
    }
    else if(instruction == "Divide"){
        if(casted_type->isFloatingPointTy()){
            return Builder->CreateFDiv(L,R, "divtmp");
        }
        else if(casted_type->isIntegerTy()){
            return Builder->CreateSDiv(L,R, "divtmp");
        }
    }
    else if(instruction == "Remainder"){
        if(casted_type->isFloatingPointTy()){
            return Builder->CreateFRem(L,R, "remtmp");
        }
        else if(casted_type->isIntegerTy()){
            return Builder->CreateSRem(L,R, "remtmp");
        }
    }
    else if(instruction == "LessThan"){
        if(casted_type->isFloatingPointTy()){
            L = Builder->CreateFCmpULT(L,R,"cmptmp");
        }
        else if(casted_type->isIntegerTy()){
            L = Builder->CreateICmpULT(L,R,"cmptmp");
        }
        return Builder->CreateUIToFP(L,casted_type,"booltmp");
    }
    else if(instruction == "GreaterThan"){
        if(casted_type->isFloatingPointTy()){
            L = Builder->CreateFCmpUGT(L,R,"cmptmp");
        }
        else if(casted_type->isIntegerTy()){
            L = Builder->CreateICmpUGT(L,R,"cmptmp");
        }
        return Builder->CreateUIToFP(L,casted_type,"booltmp");
    }
    else if(instruction == "CheckEquality"){
        if(casted_type->isFloatingPointTy()){
            L = Builder->CreateFCmpUEQ(L,R,"cmptmp");
        }
        else if(casted_type->isIntegerTy()){
            L = Builder->CreateICmpEQ(L,R,"cmptmp");
        }
        return Builder->CreateUIToFP(L,casted_type,"booltmp");
    }
    else if(instruction == "GreaterThanEqualTo"){
        if(casted_type->isFloatingPointTy()){
            L = Builder->CreateFCmpUGE(L,R,"cmptmp");
        }
        else if(casted_type->isIntegerTy()){
            L = Builder->CreateICmpUGE(L,R,"cmptmp");
        }
        return Builder->CreateUIToFP(L,casted_type,"booltmp");
    }
    else if(instruction == "LessThanEqualTo"){
        if(casted_type->isFloatingPointTy()){
            L = Builder->CreateFCmpULE(L,R,"cmptmp");
        }
        else if(casted_type->isIntegerTy()){
            L = Builder->CreateICmpULE(L,R,"cmptmp");
        }
        return Builder->CreateUIToFP(L,casted_type,"booltmp");
    }
    else if(instruction == "NotEqual"){
        if(casted_type->isFloatingPointTy()){
            L = Builder->CreateFCmpUNE(L,R,"cmptmp");
        }
        else if(casted_type->isIntegerTy()){
            L = Builder->CreateICmpNE(L,R,"cmptmp");
        }
        return Builder->CreateUIToFP(L,casted_type,"booltmp");
    }
    else if(instruction == "And"){
        //No short circuit
        L = Builder->CreateAnd(L,R,"cmptmp");
        return Builder->CreateUIToFP(L,casted_type,"booltmp");
    }
    else if(instruction == "Or"){
        //No short circuit
        L = Builder->CreateOr(L,R,"cmptmp");
        return Builder->CreateUIToFP(L,casted_type,"booltmp");
    }

    return nullptr;
}
