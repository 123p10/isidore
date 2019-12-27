#ifndef ASTNODES_H
#define ASTNODES_H
#include <string>
#include <memory>
#include "../files/file_handler.h"
#include "llvm/IR/Value.h"
#include "../code_generation/code_gen.h"
#include <vector>
#include "llvm/IR/Function.h"
class CodeGenerator;
void init();
class ExprAST {
public:
    virtual ~ExprAST() = default;
    virtual llvm::Value *codegen() = 0;
};
class NumberExprAST : public ExprAST {
    CodeGenerator *code_gen;
    double Val;
    public:
        NumberExprAST(std::string numToken);
        llvm::Value *codegen() override;

};

class VariableExprAST : public ExprAST{
    CodeGenerator *code_gen;

    std::string Name;
    public:
        VariableExprAST(const std::string &Name);
        llvm::Value *codegen() override;

};
class BinaryExprAST : public ExprAST {
    std::string Op;
    std::unique_ptr<ExprAST> LHS, RHS;

    public:
        BinaryExprAST(std::string op, std::unique_ptr<ExprAST> LHS,
                        std::unique_ptr<ExprAST> RHS);
        llvm::Value *codegen() override;
};
class CallExprAST : public ExprAST {
    std::string Callee;
    std::vector<std::unique_ptr<ExprAST>> Args;

    public:
        CallExprAST(const std::string &Callee,
                std::vector<std::unique_ptr<ExprAST>> Args)
        : Callee(Callee), Args(std::move(Args)) {}
        llvm::Value *codegen() override;
};

class PrototypeAST {
  std::string Name;
  std::vector<std::string> Args;

public:
  PrototypeAST(const std::string &Name, std::vector<std::string> Args)
      : Name(Name), Args(std::move(Args)) {}

  llvm::Function *codegen();
  const std::string &getName() const { return Name; }
};
class FunctionAST {
  std::unique_ptr<PrototypeAST> Proto;
  std::unique_ptr<ExprAST> Body;

public:
  FunctionAST(std::unique_ptr<PrototypeAST> Proto,
              std::unique_ptr<ExprAST> Body)
      : Proto(std::move(Proto)), Body(std::move(Body)) {}

  llvm::Function *codegen();
};
#endif