#ifndef ASTTREE_H
#define ASTTREE_H
#include <string>
#include <memory>
#include <vector>
#include "ASTNodes.h"
#include "../parsing/lexer.h"
#include "../files/file_handler.h"
#include "llvm/ADT/STLExtras.h"
#include "../code_generation/code_gen.h"

class ASTTree{
    private:
        ProgramFile source_file;
        Token currToken;
        int token_i;
    public:
        CodeGenerator *code_gen;
        ASTTree();
        ASTTree(ProgramFile source_file);
        ASTTree(ProgramFile source_file,CodeGenerator *code_gen);
        std::unique_ptr<ExprAST> ParseNumberExpr();
        std::unique_ptr<ExprAST> ParseParenExpr();
        std::unique_ptr<ExprAST> ParseIdentifierExpr();
        std::unique_ptr<ExprAST> ParsePrimary();
        std::unique_ptr<ExprAST> ParseExpression();
        std::unique_ptr<ExprAST> ParseBinOpRHS(int ExprPrec,std::unique_ptr<ExprAST> LHS);
        std::unique_ptr<PrototypeAST> ParsePrototype();
        std::unique_ptr<FunctionAST> ParseDefinition();
        std::unique_ptr<PrototypeAST> ParseExtern();
        std::unique_ptr<FunctionAST> ParseTopLevelExpr();
        std::unique_ptr<ExprAST> ParseIfExpr();
        std::unique_ptr<ExprAST> ParseForExpr();
        std::unique_ptr<ExprAST> ParseUnary();
        std::unique_ptr<ExprAST> ParseVarExpr();
        std::unique_ptr<ExprAST> ParseReturnExpr();
        std::unique_ptr<ExprAST> ParseCharExpr();
        std::unique_ptr<ExprAST> ParseStringExpr();
        std::unique_ptr<ClassDeclarationAST> ParseClassDef();
        std::unique_ptr<ExprAST> ParseClassInit();
        int GetTokPrecedence();
        Token getCurrToken();
        Token nextToken();
        std::vector<std::unique_ptr<ExprAST>> ParseStatementList();
        llvm::Type * type_from_name(Token data_token);

};

std::unique_ptr<ExprAST> LogError(const char *Str);
std::unique_ptr<PrototypeAST> LogErrorP(const char *Str);
std::unique_ptr<ClassDeclarationAST> LogErrorC(const char *Str);

#endif