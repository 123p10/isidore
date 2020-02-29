#ifndef FLOATING_POINT_TYPE_DOUBLE_H
#define FLOATING_POINT_TYPE_DOUBLE_H
#include "type.h"
#include "floating_point.h"
class Double : public FloatingPoint{
    public:
        using FloatingPoint::FloatingPoint;
        llvm::Type * getType();
        ~Double() = default;
};

#endif