#ifndef FLOATING_TYPE_H
#define FLOATING_TYPE_H
#include "type.h"
class FloatingPoint : public Type{
    public:
        using Type::Type;
        virtual llvm::Type * getType() = 0;
        llvm::Value * castToType(llvm::Value *value, llvm::Type * type);
        virtual ~FloatingPoint() = default;
        llvm::Value * operator_add(llvm::Value *L, llvm::Value *R);
        llvm::Value * operator_sub(llvm::Value *L, llvm::Value *R);
        llvm::Value * operator_mul(llvm::Value *L, llvm::Value *R);
        llvm::Value * operator_div(llvm::Value *L, llvm::Value *R);
        llvm::Value * operator_rem(llvm::Value *L, llvm::Value *R);
        
        llvm::Value * operator_less_than(llvm::Value *L, llvm::Value *R);
        llvm::Value * operator_greater_than(llvm::Value *L, llvm::Value *R);
        llvm::Value * operator_greater_than_equals(llvm::Value *L, llvm::Value *R);
        llvm::Value * operator_less_than_equals(llvm::Value *L, llvm::Value *R);
        llvm::Value * operator_compare_equals(llvm::Value *L, llvm::Value *R);
        llvm::Value * operator_compare_not_equals(llvm::Value *L, llvm::Value *R);

};

#endif