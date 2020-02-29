#include "type_manager.h"
TypeManager::TypeManager(llvm::LLVMContext *TheContext,llvm::IRBuilder<> *Builder){
    (*this).TheContext = TheContext;
    (*this).Builder = Builder;
    int64_type = new Int64(TheContext,Builder);
    short_type = new Short(TheContext,Builder);
    double_type = new Double(TheContext,Builder);
}
TypeManager::~TypeManager(){
    delete int64_type;
    delete short_type;
    delete double_type;
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
    Type * value_type = getType(value->getType());
    if(!value_type){
        return value;
    }
    return value_type->castToType(value,type);
}
Type * TypeManager::getType(llvm::Type * type){
    if(type == llvm::Type::getInt64Ty(*TheContext)){
        return int64_type;
    }
    else if(type == llvm::Type::getInt8Ty(*TheContext)){
        return short_type;
    }
    else if(type == llvm::Type::getDoubleTy(*TheContext)){
        return double_type;
    }
    return nullptr;
}
