#ifndef MAIN_DRIVER_H
#define MAIN_DRIVER_H
#include "../parsing/lexer.h"
#include "../files/file_handler.h"
#include "../AST/ASTTree.h"
class Driver{
    bool showCode = false;
    public:
        Driver(bool showCode_t);
        void HandleDefinition(ASTTree & source_tree, CodeGenerator * code_gen);
        void HandleExtern(ASTTree & source_tree, CodeGenerator * code_gen);
        void HandleTopLevelExpression(ASTTree & source_tree, CodeGenerator * code_gen);
};
#endif