#ifndef MAIN_DRIVER_H
#define MAIN_DRIVER_H
#include "../parsing/lexer.h"
#include "../files/file_handler.h"
#include "../AST/ASTTree.h"

void HandleDefinition(ASTTree & source_tree);
void HandleExtern(ASTTree & source_tree);
void HandleTopLevelExpression(ASTTree & source_tree, CodeGenerator * code_gen);
#endif