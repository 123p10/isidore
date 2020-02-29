#include "type.h"
#include "../type_manager.h"

Type::Type(TypeManager * typeManager){
    (*this).typeManager = typeManager;
    (*this).Builder = typeManager->Builder;
    (*this).TheContext = typeManager->TheContext;
}
