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
typedef struct Argument Argument;


class ExprAST {
public:
    CodeGenerator * code_gen;
    virtual ~ExprAST() = default;
    bool isReturn = false;
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
        const std::string &getName() const { return Name; }
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
  std::unique_ptr<ExprAST> Cond, Else;
  std::vector<std::unique_ptr<ExprAST>> ThenList;
  std::vector<std::unique_ptr<ExprAST>> ElseThenList;
  CodeGenerator * code_gen;
  public:
    IfExprAST(std::unique_ptr<ExprAST> Cond,std::vector<std::unique_ptr<ExprAST>> Then, std::vector<std::unique_ptr<ExprAST>> ElseThen, CodeGenerator * code_gen);
    llvm::Value *codegen() override;
};
class ForExprAST : public ExprAST{
  std::unique_ptr<ExprAST> Start, End, Step;
  std::vector<std::unique_ptr<ExprAST>> BodyList;

  CodeGenerator * code_gen;
  public:

    ForExprAST(std::unique_ptr<ExprAST> Start, std::unique_ptr<ExprAST> End, std::unique_ptr<ExprAST> Step, std::vector<std::unique_ptr<ExprAST>> BodyList, CodeGenerator * code_gen)
    : Start(std::move(Start)), End(std::move(End)), Step(std::move(Step)), BodyList(std::move(BodyList)),code_gen(code_gen){}
    llvm::Value *codegen() override;
};

class UnaryExprAST : public ExprAST{
  std::string Opcode;
  std::unique_ptr<ExprAST> Operand;
  CodeGenerator * code_gen;
  public:
      UnaryExprAST(std::string Opcode, std::unique_ptr<ExprAST> Operand, CodeGenerator * code_gen)
    : Opcode(Opcode), Operand(std::move(Operand)), code_gen(code_gen) {}
      llvm::Value *codegen() override;
};

class VarExprAST : public ExprAST{
  std::vector<std::pair<std::string, std::unique_ptr<ExprAST>>> VarNames;
  llvm::Type * type;
  CodeGenerator * code_gen;
  bool isArray;
  std::unique_ptr<ExprAST> size;
  public:
    VarExprAST(std::vector<std::pair<std::string, std::unique_ptr<ExprAST>>> VarNames, llvm::Type * type,  CodeGenerator * code_gen)
    : VarNames(std::move(VarNames)), type(std::move(type)), code_gen(code_gen) {}
    VarExprAST(std::vector<std::pair<std::string, std::unique_ptr<ExprAST>>> VarNames, llvm::Type * type,  CodeGenerator * code_gen, bool isArray, std::unique_ptr<ExprAST> size);
    llvm::Value *codegen() override;
};

class ReturnExprAST : public ExprAST{
  CodeGenerator * code_gen;
  std::unique_ptr<ExprAST> returnExpr;
    public:
          ReturnExprAST(std::unique_ptr<ExprAST> returnExpr,CodeGenerator * code_gen);
        llvm::Value *codegen() override;

};

class PrototypeAST {
  std::string Name;
  std::vector<Argument> Args;
  CodeGenerator * code_gen;
  llvm::Type * type;
  bool IsOperator;
  unsigned Precedence;
  public:
  PrototypeAST(const std::string &name, std::vector<Argument> Args,
                CodeGenerator * code_gen, llvm::Type * type, bool IsOperator = false, unsigned Prec = 0)
  : Name(name),Args(std::move(Args)), code_gen(code_gen), type(std::move(type)),IsOperator(IsOperator),
    Precedence(Prec) {}
    llvm::Function *codegen();
    const std::string &getName() const { return Name; }
    bool isUnaryOp() const { return IsOperator && Args.size() == 1; }
    bool isBinaryOp() const { return IsOperator && Args.size() == 2; }
    char getOperatorName() const {
      assert(isUnaryOp() || isBinaryOp());
      return Name[Name.size() - 1];
    }
    unsigned getBinaryPrecedence() const { return Precedence; }

};
class FunctionAST {
  std::unique_ptr<PrototypeAST> Proto;
  std::vector<std::unique_ptr<ExprAST>> Body;
    CodeGenerator * code_gen;

public:
  FunctionAST(std::unique_ptr<PrototypeAST> Proto,
              std::vector<std::unique_ptr<ExprAST>> Body, CodeGenerator * code_gen);
  llvm::Function *codegen();
};
#endif