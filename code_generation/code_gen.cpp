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
    Type * casted_type_obj = typeManager->getType(casted_type);
    if(instruction == "Add"){
        return casted_type_obj->operator_add(L,R);
    }
    else if(instruction == "Subtract"){
        return casted_type_obj->operator_sub(L,R);
    }
    else if(instruction == "Multiply"){
        return casted_type_obj->operator_mul(L,R);
    }
    else if(instruction == "Divide"){
        return casted_type_obj->operator_div(L,R);
    }
    else if(instruction == "Remainder"){
        return casted_type_obj->operator_rem(L,R);
    }
    else if(instruction == "LessThan"){
        return casted_type_obj->operator_less_than(L,R);
    }
    else if(instruction == "GreaterThan"){
        return casted_type_obj->operator_greater_than(L,R);
    }
    else if(instruction == "CheckEquality"){
        return casted_type_obj->operator_compare_equals(L,R);
    }
    else if(instruction == "GreaterThanEqualTo"){
        return casted_type_obj->operator_greater_than_equals(L,R);
    }
    else if(instruction == "LessThanEqualTo"){
        return casted_type_obj->operator_less_than_equals(L,R);
    }
    else if(instruction == "NotEqual"){
        return casted_type_obj->operator_compare_not_equals(L,R);
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
