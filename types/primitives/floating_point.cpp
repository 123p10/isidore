#include "floating_point.h"
llvm::Value * FloatingPoint::castToType(llvm::Value *value, llvm::Type * type){
    if(type->isFloatingPointTy()){
        return Builder->CreateFPCast(value,type);
    }
    else if(type->isIntegerTy()){
        //if doing unsigned this must be changed
        return Builder->CreateFPToSI(value,type);
    }
    return value;
}
