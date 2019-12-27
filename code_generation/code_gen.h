#ifndef CODE_GEN_H
#define CODE_GEN_H
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
class CodeGenerator{
    public:
        std::unique_ptr<llvm::Module> *TheModule;
        llvm::LLVMContext *TheContext;
        llvm::IRBuilder<> *Builder;
        std::map<std::string, llvm::Value *> NamedValues;
        ~CodeGenerator();
        CodeGenerator();
};

llvm::Value *LogErrorV(const char *Str);
#endif