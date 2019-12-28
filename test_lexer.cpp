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

int main(){
    std::ifstream my_file("test.isd");
    CodeGenerator * code_gen = new CodeGenerator();
    ProgramFile test_file(my_file);
    tokenize_file(test_file);
    int index = 0;

    while(test_file.GetLine(index).size() != 0){
        ASTTree source_tree(test_file,code_gen);
        while(1){
            if(source_tree.getCurrToken().value == "EOF"){
                return 1;
            }
            else if(source_tree.getCurrToken().type == "semicolon"){
                source_tree.nextToken();
            }
            else if(source_tree.getCurrToken().type == "data_void"){
                HandleDefinition(source_tree,code_gen);
            }
            else if(source_tree.getCurrToken().type == "extern"){
                HandleExtern(source_tree,code_gen);
            }
            else{
                HandleTopLevelExpression(source_tree,code_gen);
            }
        }
    }
    code_gen->TheModule->get()->print(llvm::errs(), nullptr);
    delete code_gen;

}