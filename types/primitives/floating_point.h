#ifndef FLOATING_TYPE_H
#define FLOATING_TYPE_H
#include "type.h"
class FloatingPoint : public Type{
    public:
        using Type::Type;
        virtual llvm::Type * getType() = 0;
        llvm::Value * castToType(llvm::Value *value, llvm::Type * type);
        virtual ~FloatingPoint() = default;
};

#endif