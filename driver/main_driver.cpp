#include "main_driver.h"
#include "llvm/Support/raw_ostream.h"

void HandleDefinition(ASTTree & source_tree){
    if(auto FnAST = source_tree.ParseDefinition()){
        if(auto *FnIR = FnAST->codegen()){
            fprintf(stderr, "Read function definition:");
            FnIR->print(llvm::errs());
            fprintf(stderr, "\n");
        }
    }
    else{
        source_tree.nextToken();
    }
}
void HandleExtern(ASTTree & source_tree){
    if(auto ProtoAST = source_tree.ParseExtern()){
        if(auto *FnIR = ProtoAST->codegen()){
            fprintf(stderr, "Read extern: ");
            FnIR->print(llvm::errs());
            fprintf(stderr, "\n");            
        }
    }
    else{
        source_tree.nextToken();
    }
}
void HandleTopLevelExpression(ASTTree & source_tree){
    if(auto FnAST = source_tree.ParseTopLevelExpr()){
        if(auto *FnIR = FnAST->codegen()){
            fprintf(stderr,"Read top-level expression:");
            FnIR->print(llvm::errs());
            fprintf(stderr, "\n");
        }
    }
    else{
        source_tree.nextToken();
    }
}
