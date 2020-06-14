#include "int64.h"
llvm::Type * Int64::getType(){
    return llvm::Type::getInt64Ty(*TheContext);
}
