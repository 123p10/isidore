#include <iostream>
#include <fstream>
#include "parsing/lexer.h"
#include "files/file_handler.h"
#include "AST/ASTTree.h"
int main(){
    std::ifstream my_file("test.isd");
    ProgramFile test_file(my_file);
    tokenize_file(test_file);
    int index = 0;
    while(test_file.GetLine(index).size() != 0){
        for(int ch = 0; ch < test_file.GetLine(index).size();ch++){
            std::cout << test_file.GetLine(index).at(ch);
        }
        index++;
    }
    for(index = 0; index < test_file.TokenListSize();index++){
        std::cout << test_file.GetToken(index).type + " " + test_file.GetToken(index).value << '\n';
    }
    for(index = 0; index < 10;index++){
        std::cout << "\n";
    }
    ASTTree source_tree(test_file);
    while(1){
        if(source_tree.getCurrToken().value == "EOF"){
            return 1;
        }
        else if(source_tree.getCurrToken().type == "semicolon"){
            source_tree.nextToken();
        }
        else if(source_tree.getCurrToken().type == "data_void"){
            if(source_tree.ParseDefinition()){
                std::cout << "Parsed a function \n";
            }
            else{
                std::cout << "function error";
                source_tree.nextToken();
            }
        }
        else{
            if(source_tree.ParseTopLevelExpr()){
                std::cout << "Parsed a top level expr \n";
            }
            else{
                std::cout << "top level error";
                source_tree.nextToken();
            }
        }
    }
}