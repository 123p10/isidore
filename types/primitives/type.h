
#ifndef TYPE_H
#define TYPE_H

#include "llvm/IR/IRBuilder.h"
#include "clang/AST/Type.h"
#include "llvm/IR/LLVMContext.h"
class TypeManager;
class Type{
    protected:
        llvm::IRBuilder<> *Builder;
        llvm::LLVMContext *TheContext;
        TypeManager * typeManager;
    public:
        Type(){}
        Type(TypeManager * typeManager);
        virtual llvm::Type * getType() = 0;
        virtual llvm::Value * castToType(llvm::Value *value, llvm::Type * type) = 0;
        virtual ~Type() = default;

//        virtual llvm::Value * operator_add(llvm::Value *L, llvm::Value *R);
};

#endif