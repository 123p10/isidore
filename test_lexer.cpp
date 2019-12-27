#include <iostream>
#include <fstream>
#include "parsing/lexer.h"
#include "files/file_handler.h"
#include "AST/ASTTree.h"
#include "AST/ASTNodes.h"
#include "driver/main_driver.h"
#include "code_generation/code_gen.h"
#include "llvm/Support/raw_ostream.h"


int main(){
    std::ifstream my_file("test.isd");
    ProgramFile test_file(my_file);
    init();
    tokenize_file(test_file);
    int index = 0;

    while(test_file.GetLine(index).size() != 0){
        ASTTree source_tree(test_file);
        while(1){
            if(source_tree.getCurrToken().value == "EOF"){
                return 1;
            }
            else if(source_tree.getCurrToken().type == "semicolon"){
                source_tree.nextToken();
            }
            else if(source_tree.getCurrToken().type == "data_void"){
                HandleDefinition(source_tree);
            }
            else if(source_tree.getCurrToken().type == "extern"){
                HandleExtern(source_tree);
            }
            else{
                std::cout << "Here";
                if(auto FnAST = source_tree.ParseTopLevelExpr()){
                    if(auto *FnIR = FnAST->codegen()){
                        fprintf(stderr,"Read top-level expression:");
                        FnIR->print(llvm::errs());
                        fprintf(stderr, "\n");
                    }
                }
                else{
                    source_tree.nextToken();
                }
            }
        }
    }
    //TheModule->print(llvm::errs(), nullptr);
}