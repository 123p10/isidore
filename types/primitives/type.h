
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
        //Toss error I suppose
        virtual llvm::Value * operator_add(llvm::Value *L, llvm::Value *R) = 0;
        virtual llvm::Value * operator_sub(llvm::Value *L, llvm::Value *R) = 0;
        virtual llvm::Value * operator_mul(llvm::Value *L, llvm::Value *R) = 0;
        virtual llvm::Value * operator_div(llvm::Value *L, llvm::Value *R) = 0;
        virtual llvm::Value * operator_rem(llvm::Value *L, llvm::Value *R) = 0;
        virtual llvm::Value * operator_less_than(llvm::Value *L, llvm::Value *R) = 0;
        virtual llvm::Value * operator_greater_than(llvm::Value *L, llvm::Value *R) = 0;
        virtual llvm::Value * operator_greater_than_equals(llvm::Value *L, llvm::Value *R) = 0;
        virtual llvm::Value * operator_less_than_equals(llvm::Value *L, llvm::Value *R) = 0;
        virtual llvm::Value * operator_compare_equals(llvm::Value *L, llvm::Value *R) = 0;
        virtual llvm::Value * operator_compare_not_equals(llvm::Value *L, llvm::Value *R) = 0;

};

#endif