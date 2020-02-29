#ifndef INTEGER_TYPE_EIGHT_H
#define INTEGER_TYPE_EIGHT_H
#include "type.h"
#include "integer.h"
class Short : public Integer{
    public:
        using Integer::Integer;
        llvm::Type * getType();
        ~Short() = default;

};

#endif