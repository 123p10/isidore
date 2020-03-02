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
llvm::Value * FloatingPoint::operator_add(llvm::Value *L, llvm::Value *R){
    return Builder->CreateFAdd(L,R, "addtmp");
}
llvm::Value * FloatingPoint::operator_sub(llvm::Value *L, llvm::Value *R){
    return Builder->CreateFSub(L,R, "subtmp");
}

llvm::Value * FloatingPoint::operator_mul(llvm::Value *L, llvm::Value *R){
    return Builder->CreateFMul(L,R, "multmp");
}
llvm::Value * FloatingPoint::operator_div(llvm::Value *L, llvm::Value *R){
    return Builder->CreateFDiv(L,R, "divtmp");
}
llvm::Value * FloatingPoint::operator_rem(llvm::Value *L, llvm::Value *R){
    return Builder->CreateFRem(L,R, "remtmp");
}
llvm::Value * FloatingPoint::operator_less_than(llvm::Value *L, llvm::Value *R){
    return Builder->CreateFCmpULT(L,R,"cmptmp");
}
llvm::Value * FloatingPoint::operator_greater_than(llvm::Value *L, llvm::Value *R){
    return Builder->CreateFCmpUGT(L,R,"cmptmp");
}
llvm::Value * FloatingPoint::operator_greater_than_equals(llvm::Value *L, llvm::Value *R){
    return Builder->CreateFCmpUGE(L,R,"cmptmp");
}
llvm::Value * FloatingPoint::operator_less_than_equals(llvm::Value *L, llvm::Value *R){
    return Builder->CreateFCmpULE(L,R,"cmptmp");
}
llvm::Value * FloatingPoint::operator_compare_equals(llvm::Value *L, llvm::Value *R){
    return Builder->CreateFCmpUEQ(L,R,"cmptmp");
}
