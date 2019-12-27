#ifndef CODE_GEN_H
#define CODE_GEN_H
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
class CodeGenerator{
    public:

        CodeGenerator();
};

llvm::Value *LogErrorV(const char *Str);
#endif