#ifndef INTEGER_TYPE_64_H
#define INTEGER_TYPE_64_H
#include "type.h"
#include "integer.h"
class Int64 : public Integer{
    public:
        using Integer::Integer;
        llvm::Type * getType();
        ~Int64() = default;

};

#endif