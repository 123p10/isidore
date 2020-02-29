#ifndef TYPE_MANAGER_H
#define TYPE_MANAGER_H

#include "clang/AST/Type.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/LegacyPassManager.h"
#include "primitives/int64.h"
#include "primitives/short.h"
#include "primitives/double.h"
class CodeGenerator;
class TypeManager{

    Int64 * int64_type;
    Short * short_type;
    Double * double_type;
    //Floating Point Type Class
    //Array Class
    //operator add
    public:
        llvm::LLVMContext *TheContext;
        llvm::IRBuilder<> *Builder;

        TypeManager(llvm::LLVMContext *TheContext,llvm::IRBuilder<> *Builder);
        ~TypeManager();
        llvm::Type * auto_cast(llvm::Value *&value_1, llvm::Value * & value_2);
        llvm::Value * castToType(llvm::Value *value, llvm::Type * type);
        llvm::Type * highest_order_type(llvm::Type * type_1, llvm::Type * type_2);
        int type_hierarchy(llvm::Type * type);
        Type * getType(llvm::Type * type);
};

#endif
