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

class IfExprAST : public ExprAST{
  std::unique_ptr<ExprAST> Cond, Then, Else;
  CodeGenerator * code_gen;
  public:
    IfExprAST(std::unique_ptr<ExprAST> Cond, std::unique_ptr<ExprAST> Then, std::unique_ptr<ExprAST> Else, CodeGenerator * code_gen)
    : Cond(std::move(Cond)), Then(std::move(Then)), Else(std::move(Else)), code_gen(code_gen){}
    llvm::Value *codegen() override;
};
class ForExprAST : public ExprAST{
  std::string VarName;
  std::unique_ptr<ExprAST> Start, End, Step, Body;
  CodeGenerator * code_gen;
  public:

    ForExprAST(const std::string &VarName, std::unique_ptr<ExprAST> Start, std::unique_ptr<ExprAST> End, std::unique_ptr<ExprAST> Step, std::unique_ptr<ExprAST> Body, CodeGenerator * code_gen)
    : VarName(VarName), Start(std::move(Start)), End(std::move(End)), Step(std::move(Step)), Body(std::move(Body)),code_gen(code_gen){}
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