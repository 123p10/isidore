#ifndef ASTNODES_H
#define ASTNODES_H
#include <string>
#include <memory>
#include "../files/file_handler.h"
#include <vector>
class ExprAST {
public:
  virtual ~ExprAST();
};
class NumberExprAST : public ExprAST {
public:
    double value;
    public:
        NumberExprAST(std::string numToken);
        double getValue();

};

class VariableExprAST : public ExprAST{
    std::string Name;
    public:
        VariableExprAST(const std::string &Name);
};
class BinaryExprAST : public ExprAST {
    std::string Op;
    std::unique_ptr<ExprAST> LHS, RHS;

    public:
    BinaryExprAST(std::string op, std::unique_ptr<ExprAST> LHS,
                    std::unique_ptr<ExprAST> RHS);
};
class CallExprAST : public ExprAST {
      std::string Callee;
    std::vector<std::unique_ptr<ExprAST>> Args;

    public:
        CallExprAST(const std::string &Callee,
                std::vector<std::unique_ptr<ExprAST>> Args)
        : Callee(Callee), Args(std::move(Args)) {}
};

class PrototypeAST {
    std::string Name;
    std::vector<std::string> Args;

    public:
        PrototypeAST(const std::string &name, std::vector<std::string> Args)
            : Name(name), Args(std::move(Args)) {}

        const std::string &getName() const { return Name; }
};
class FunctionAST {
    std::unique_ptr<PrototypeAST> Proto;
    std::unique_ptr<ExprAST> Body;

    public:
    FunctionAST(std::unique_ptr<PrototypeAST> Proto,
                std::unique_ptr<ExprAST> Body)
        : Proto(std::move(Proto)), Body(std::move(Body)) {}
};
#endif