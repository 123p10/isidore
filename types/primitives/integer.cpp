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
llvm::Value * Integer::operator_add(llvm::Value *L, llvm::Value *R){
    return Builder->CreateAdd(L,R, "addtmp");
}
llvm::Value * Integer::operator_sub(llvm::Value *L, llvm::Value *R){
    return Builder->CreateSub(L,R, "subtmp");
}
llvm::Value * Integer::operator_mul(llvm::Value *L, llvm::Value *R){
    return Builder->CreateMul(L,R, "multmp");
}
llvm::Value * Integer::operator_div(llvm::Value *L, llvm::Value *R){
    return Builder->CreateSDiv(L,R, "divtmp");
}
llvm::Value * Integer::operator_rem(llvm::Value *L, llvm::Value *R){
    return Builder->CreateSRem(L,R, "remtmp");
}