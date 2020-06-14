#include "short.h"
llvm::Type * Short::getType(){
    return llvm::Type::getInt8Ty(*TheContext);
}
