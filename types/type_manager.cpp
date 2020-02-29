#include "type_manager.h"
TypeManager::TypeManager(llvm::LLVMContext *TheContext,llvm::IRBuilder<> *Builder){
    (*this).TheContext = TheContext;
    (*this).Builder = Builder;
}
llvm::Type * TypeManager::auto_cast(llvm::Value *&value_1, llvm::Value * & value_2){
    llvm::Type * cast_type = value_1->getType();
    if(value_1->getType() != value_2->getType()){
        cast_type = highest_order_type(value_1->getType(),value_2->getType());
        value_1 = castToType(value_1,cast_type);
        value_2 = castToType(value_2,cast_type);
    }
    return cast_type;
}
llvm::Type * TypeManager::highest_order_type(llvm::Type * type_1, llvm::Type * type_2){
    if(type_hierarchy(type_1) > type_hierarchy(type_2)){
        return type_1;
    }
    return type_2;
}
int TypeManager::type_hierarchy(llvm::Type * type){
     if(type == llvm::Type::getDoubleTy(*(TheContext))){
        return 100;
    }
    else if(type == llvm::Type::getInt64Ty(*(TheContext))){
        return 75;
    }
    else if(type == llvm::Type::getInt8Ty(*(TheContext))){
        return 10;
    }

     return 0;
}
llvm::Value * TypeManager::castToType(llvm::Value *value, llvm::Type * type){
    if(type == value->getType()){
        return value;
    }
    if(value->getType()->isIntegerTy()){
        if(type->isFloatingPointTy()){
            return Builder->CreateSIToFP(value,type);
        }
        else if(type->isIntegerTy()){
            return Builder->CreateIntCast(value,type,true);
        }
    }
    else if(value->getType()->isFloatingPointTy()){
        if(type->isIntegerTy()){
            return Builder->CreateFPToSI(value,type);
        }
        else if(type->isFloatingPointTy()){
            return Builder->CreateFPCast(value,type);
        }
    }
    if(type->isArrayTy()){
    }
    return value;

}
