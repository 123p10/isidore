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
int main(int argc, char* argv[]){
    bool showCode = false;
    //bool optimizations = true;
    std::string file_name = "main.isd";
    for(int i = 0;i < argc;i++){
        if(strcmp(argv[i],"-f") == 0){
            file_name = argv[i+1];
        }
        else if(strcmp(argv[i],"-o") == 0){
         //   optimizations = false;
        }
        else if(strcmp(argv[i],"-d") == 0){
            showCode = true;
        //    optimizations = false;
        }
        else if(strcmp(argv[i],"-c") == 0){
            showCode = true;
        }
    }
    std::ifstream my_file(file_name);
    CodeGenerator * code_gen = new CodeGenerator();
    ProgramFile test_file(my_file);
    tokenize_file(test_file);
    ASTTree source_tree(test_file,code_gen);
    Driver my_driver(showCode);
    while(1){
        if(source_tree.getCurrToken().value == "EOF"){
            break;
        }
        else if(source_tree.getCurrToken().type == "semicolon"){
            source_tree.nextToken();
        }
        else if(source_tree.isType(source_tree.getCurrToken())){
            my_driver.HandleDefinition(source_tree,code_gen);
        }
        else if(source_tree.getCurrToken().type == "extern"){
            my_driver.HandleExtern(source_tree,code_gen);
        }
        else if(source_tree.getCurrToken().type == "class"){
            my_driver.HandleClassDeclaration(source_tree,code_gen);
        }
        else{
            my_driver.HandleTopLevelExpression(source_tree,code_gen);
        }
    }
    //code_gen->TheModule->get()->print(llvm::errs(), nullptr);
    //wonder if this will cause memory leak?
    //delete code_gen;
    return 0;
}
