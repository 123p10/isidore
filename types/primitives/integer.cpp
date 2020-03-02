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
llvm::Value * Integer::operator_less_than(llvm::Value *L, llvm::Value *R){
    return Builder->CreateICmpSLT(L,R,"cmptmp");
}
llvm::Value * Integer::operator_greater_than(llvm::Value *L, llvm::Value *R){
    return Builder->CreateICmpSGT(L,R,"cmptmp");
}
llvm::Value * Integer::operator_greater_than_equals(llvm::Value *L, llvm::Value *R){
    return Builder->CreateICmpSGE(L,R,"cmptmp");
}
llvm::Value * Integer::operator_less_than_equals(llvm::Value *L, llvm::Value *R){
    return Builder->CreateICmpSLE(L,R,"cmptmp");
}
llvm::Value * Integer::operator_compare_equals(llvm::Value *L, llvm::Value *R){
    return Builder->CreateICmpEQ(L,R,"cmptmp");
}
llvm::Value * Integer::operator_compare_not_equals(llvm::Value *L, llvm::Value *R){
    return Builder->CreateICmpNE(L,R,"cmptmp");
}
