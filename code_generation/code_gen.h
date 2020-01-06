#ifndef CODE_GEN_H
#define CODE_GEN_H
#include "../AST/ASTNodes.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/LegacyPassManager.h"
#include "../JIT/KaleidoscopeJIT.h"
class PrototypeAST;
struct Variable
{
    llvm::AllocaInst *value;
    llvm::Type *type;
};

class CodeGenerator{
    public:
        void initPrecedence();
        std::map<std::string, int> BinopPrecedence;

        std::unique_ptr<llvm::Module> *TheModule;
        llvm::LLVMContext *TheContext;
        llvm::IRBuilder<> *Builder;
        std::map<std::string, Variable> NamedValues;
        std::unique_ptr<llvm::legacy::FunctionPassManager> *TheFPM;
        std::unique_ptr<llvm::orc::KaleidoscopeJIT> *TheJIT;
        std::map<std::string, std::unique_ptr<PrototypeAST>> *FunctionProtos;
        
        llvm::Function *getFunction(std::string Name);
        void InitializeModuleAndPassManager(void);
        llvm::AllocaInst *CreateEntryBlockAlloca(llvm::Function *TheFunction, const std::string &VarName);
        
        CodeGenerator();
        ~CodeGenerator();

};
llvm::Value *LogErrorV(const char *Str);
#endif