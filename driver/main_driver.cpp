#include "main_driver.h"
#include "llvm/Support/raw_ostream.h"
#include <cstdint>
void HandleDefinition(ASTTree & source_tree, CodeGenerator * code_gen){
    if(auto FnAST = source_tree.ParseDefinition()){
        if(FnAST->codegen()){
            code_gen->TheJIT->get()->addModule(std::move(*(code_gen->TheModule)));
            code_gen->InitializeModuleAndPassManager();
        }
    }
    else{
        source_tree.nextToken();
    }
}
void HandleExtern(ASTTree & source_tree,CodeGenerator * code_gen){
    if(auto ProtoAST = source_tree.ParseExtern()){
        if(auto *FnIR = ProtoAST->codegen()){
            fprintf(stderr, "Read extern: ");
            FnIR->print(llvm::errs());
            fprintf(stderr, "\n");
            (*(code_gen->FunctionProtos))[ProtoAST->getName()] = std::move(ProtoAST); 
        }
    }
    else{
        source_tree.nextToken();
    }
}
void HandleTopLevelExpression(ASTTree & source_tree, CodeGenerator * code_gen){
    if(auto FnAST = source_tree.ParseTopLevelExpr()){
        if(FnAST->codegen()){
            auto H = code_gen->TheJIT->get()->addModule(std::move(*(code_gen->TheModule)));
            code_gen->InitializeModuleAndPassManager();

            auto ExprSymbol = code_gen->TheJIT->get()->findSymbol("__anon__expr");
            assert(ExprSymbol && "Function not found");
            double (*FP)() = (double(*)())(intptr_t)llvm::cantFail(ExprSymbol.getAddress());
            fprintf(stderr,"Evaluated to %f \n",FP());
            code_gen->TheJIT->get()->removeModule(H);
        }
    }
    else{
        source_tree.nextToken();
    }
}
