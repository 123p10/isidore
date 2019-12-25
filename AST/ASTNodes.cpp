#include "ASTNodes.h"

NumberExprAST::NumberExprAST(std::string numString){
    value = stod(numString);
}
double NumberExprAST::getValue(){
    return value;
}

VariableExprAST::VariableExprAST(const std::string &Name) : Name(Name){}
BinaryExprAST::BinaryExprAST(std::string op, std::unique_ptr<ExprAST> LHS, std::unique_ptr<ExprAST> RHS){
    Op = op;
    LHS = std::move(LHS);
    RHS = std::move(RHS);
}
ExprAST::~ExprAST(){}
