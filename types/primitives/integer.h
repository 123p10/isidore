#ifndef INTEGER_TYPE_H
#define INTEGER_TYPE_H
#include "type.h"

class Integer : public Type{
    public:
        using Type::Type;
        virtual llvm::Type * getType();
        llvm::Value * castToType(llvm::Value *value, llvm::Type * type);
        virtual ~Integer() = default;
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


};

#endif