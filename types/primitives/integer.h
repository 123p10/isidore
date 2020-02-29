#ifndef INTEGER_TYPE_H
#define INTEGER_TYPE_H
#include "type.h"

class Integer : public Type{
    public:
        using Type::Type;
        virtual llvm::Type * getType();
        llvm::Value * castToType(llvm::Value *value, llvm::Type * type);
        virtual ~Integer() = default;
};

#endif