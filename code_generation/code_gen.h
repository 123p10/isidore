#ifndef CODE_GEN_H
#define CODE_GEN_H
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/LegacyPassManager.h"
#include "../JIT/KaleidoscopeJIT.h"
class CodeGenerator{
    public:
        std::unique_ptr<llvm::Module> *TheModule;
        llvm::LLVMContext *TheContext;
        llvm::IRBuilder<> *Builder;
        std::map<std::string, llvm::Value *> NamedValues;
        std::unique_ptr<llvm::legacy::FunctionPassManager> *TheFPM;
        ~CodeGenerator();
        CodeGenerator();
        std::unique_ptr<llvm::orc::KaleidoscopeJIT> *TheJIT;
        void InitializeModuleAndPassManager(void);
};

llvm::Value *LogErrorV(const char *Str);
#endif