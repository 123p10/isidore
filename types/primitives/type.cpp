#include "type.h"
Type::Type(llvm::LLVMContext *TheContext,llvm::IRBuilder<> *Builder){
    (*this).Builder = Builder;
    (*this).TheContext = TheContext;
}
