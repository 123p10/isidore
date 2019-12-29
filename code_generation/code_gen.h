#ifndef CODE_GEN_H
#define CODE_GEN_H
#include "../AST/ASTNodes.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/LegacyPassManager.h"
#include "../JIT/KaleidoscopeJIT.h"
class PrototypeAST;

class CodeGenerator{
    public:
        void initPrecedence();
        std::unique_ptr<llvm::Module> *TheModule;
        llvm::LLVMContext *TheContext;
        llvm::IRBuilder<> *Builder;
        std::map<std::string, llvm::Value *> NamedValues;
        std::unique_ptr<llvm::legacy::FunctionPassManager> *TheFPM;
        std::unique_ptr<llvm::orc::KaleidoscopeJIT> *TheJIT;
        std::map<std::string, std::unique_ptr<PrototypeAST>> *FunctionProtos;
        llvm::Function *getFunction(std::string Name);
        void InitializeModuleAndPassManager(void);
        std::map<std::string, int> BinopPrecedence;
        CodeGenerator();
        ~CodeGenerator();

};
llvm::Value *LogErrorV(const char *Str);
#endif