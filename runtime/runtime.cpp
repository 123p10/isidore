#include "runtime.h"
void Runtime::createPrototypes(){
	llvm::PointerType * voidPtr = llvm::Type::getInt8Ty(*(code_gen->TheContext))->getPointerTo();
	std::vector<Argument> GC_MALLOC_TYPES;
	GC_MALLOC_TYPES.push_back({llvm::IntegerType::get(*(code_gen->TheContext),32),"size"});
	std::unique_ptr<PrototypeAST> GC_PROTO_AST = std::make_unique<PrototypeAST>("GC_malloc", GC_MALLOC_TYPES, code_gen, voidPtr);
	auto *GCIR = GC_PROTO_AST->codegen();
	(*(code_gen->FunctionProtos))[GC_PROTO_AST->getName()] = std::move(GC_PROTO_AST);
}
