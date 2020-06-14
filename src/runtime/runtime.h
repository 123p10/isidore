#include "../code_generation/code_gen.h"
#include "../AST/ASTNodes.h"
class Runtime{
	CodeGenerator * code_gen;
	public:
		Runtime(CodeGenerator * code_gen) : code_gen(code_gen){};
		void createPrototypes();
};
