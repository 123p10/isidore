#ifndef TYPE_H
#define TYPE_H
#include "llvm/IR/IRBuilder.h"
#include "clang/AST/Type.h"
#include "llvm/IR/LLVMContext.h"

class Type{
    protected:
        llvm::IRBuilder<> *Builder;
        llvm::LLVMContext *TheContext;
    public:
        Type(){}
        Type(llvm::LLVMContext *TheContext,llvm::IRBuilder<> *Builder);
        virtual llvm::Type * getType() = 0;
        virtual llvm::Value * castToType(llvm::Value *value, llvm::Type * type) = 0;
        virtual ~Type() = default;
};

#endif