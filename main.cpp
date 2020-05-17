#include <iostream>
#include <fstream>
#include "parsing/lexer.h"
#include "files/file_handler.h"
#include "AST/ASTTree.h"
#include "AST/ASTNodes.h"
#include "driver/main_driver.h"
#include "code_generation/code_gen.h"
#include "llvm/Support/raw_ostream.h"
#include "extern/extern.h"
#include "runtime/runtime.h"
int main(int argc, char* argv[]){
    bool showCode = false;
    bool optimizations = true;
    std::string file_name = "main.isd";
	std::string output_file_name = file_name + ".o";
    for(int i = 0;i < argc;i++){
        if(strcmp(argv[i],"-f") == 0){
            file_name = argv[i+1];
			output_file_name = argv[i+1] + ".o";
        }
        else if(strcmp(argv[i],"-o") == 0){
			output_file_name = argv[i+1];
        }
        else if(strcmp(argv[i],"-d") == 0){
            showCode = true;
            optimizations = false;
        }
        else if(strcmp(argv[i],"-c") == 0){
            showCode = true;
        }
    }
    std::ifstream my_file(file_name);
    CodeGenerator * code_gen = new CodeGenerator(optimizations);
    ProgramFile test_file(my_file);
    tokenize_file(test_file);
    ASTTree source_tree(test_file,code_gen);
    Driver my_driver(showCode);
    Runtime runtime(code_gen);
	runtime.createPrototypes();
	my_driver.ParseLoop(source_tree,code_gen);
	code_gen->OutputToObjectCode(output_file_name);
    //code_gen->TheModule->get()->print(llvm::errs(), nullptr);
    //wonder if this will cause memory leak?
    //delete code_gen;
    return 0;
}
