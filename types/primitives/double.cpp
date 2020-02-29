#include "double.h"
llvm::Type * Double::getType(){
    return llvm::Type::getDoubleTy(*TheContext);
}
