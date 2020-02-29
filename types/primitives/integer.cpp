#include "integer.h"
llvm::Type * Integer::getType(){
    return llvm::Type::getInt64Ty(*TheContext);
}
llvm::Value * Integer::castToType(llvm::Value *value, llvm::Type * type){
    if(type->isFloatingPointTy()){
        return Builder->CreateSIToFP(value,type);
    }
    else if(type->isIntegerTy()){
        //if doing unsigned this must be changed
        return Builder->CreateIntCast(value,type,true);
    }
    return value;
}
