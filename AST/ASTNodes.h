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

class ExprAST {
public:
    CodeGenerator * code_gen;
    virtual ~ExprAST() = default;
    virtual llvm::Value *codegen() = 0;
};
class NumberExprAST : public ExprAST {
    CodeGenerator *code_gen;
    double Val;
    public:
        NumberExprAST(std::string numToken, CodeGenerator * code_gen);
        llvm::Value *codegen();

};

class VariableExprAST : public ExprAST{
    CodeGenerator *code_gen;

    std::string Name;
    public:
        VariableExprAST(const std::string &Name, CodeGenerator * code_gen);
        llvm::Value *codegen() override;

};
class BinaryExprAST : public ExprAST {
    std::string Op;
    std::unique_ptr<ExprAST> LHS, RHS;
    CodeGenerator * code_gen;
    public:
        BinaryExprAST(std::string op, std::unique_ptr<ExprAST> LHS,
                        std::unique_ptr<ExprAST> RHS, CodeGenerator * code_gen);
        llvm::Value *codegen() override;
};
class CallExprAST : public ExprAST {
    std::string Callee;
    std::vector<std::unique_ptr<ExprAST>> Args;
    CodeGenerator * code_gen;

    public:
        CallExprAST(const std::string &Callee,
                std::vector<std::unique_ptr<ExprAST>> Args, CodeGenerator * code_gen)
        : Callee(Callee), Args(std::move(Args)), code_gen(code_gen) {}
        llvm::Value *codegen() override;
};

class PrototypeAST {
  std::string Name;
  std::vector<std::string> Args;
    CodeGenerator * code_gen;

  public:
    PrototypeAST(const std::string &Name, std::vector<std::string> Args, CodeGenerator * code_gen)
        : Name(Name), Args(std::move(Args)), code_gen(code_gen) {}

    llvm::Function *codegen();
    const std::string &getName() const { return Name; }
};
class FunctionAST {
  std::unique_ptr<PrototypeAST> Proto;
  std::unique_ptr<ExprAST> Body;
    CodeGenerator * code_gen;

public:
  FunctionAST(std::unique_ptr<PrototypeAST> Proto,
              std::unique_ptr<ExprAST> Body, CodeGenerator * code_gen)
      : Proto(std::move(Proto)), Body(std::move(Body)), code_gen(code_gen) {}

  llvm::Function *codegen();
};
#endif