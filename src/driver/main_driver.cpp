#include "main_driver.h"
#include "llvm/Support/raw_ostream.h"
#include <cstdint>
#include "../utils/StringUtils.h"
Driver::Driver(bool showCode_t){
    showCode = showCode_t;
}

void Driver::ParseLoop(ASTTree & source_tree, CodeGenerator * code_gen,std::string fileLocation){
	while(1){
        if(source_tree.getCurrToken().value == "EOF"){
            break;
        }
        else if(source_tree.getCurrToken().type == "semicolon"){
            source_tree.nextToken();
        }
        else if(source_tree.isType(source_tree.getCurrToken())){
            HandleDefinition(source_tree);
        }
        else if(source_tree.getCurrToken().type == "extern"){
            HandleExtern(source_tree,code_gen);
        }
        else if(source_tree.getCurrToken().type == "class"){
            HandleClassDeclaration(source_tree,code_gen);
        }
		else if(source_tree.getCurrToken().type == "import"){
			HandleImport(source_tree,fileLocation);
		}
        else{
            HandleTopLevelExpression(source_tree);
        }
    }
}


void Driver::HandleDefinition(ASTTree & source_tree){
    if(auto FnAST = source_tree.ParseDefinition()){
        if(auto *FnIR = FnAST->codegen()){
            if(showCode == true){
                fprintf(stderr, "Read function definition:");
                FnIR->print(llvm::errs());
                fprintf(stderr, "\n");
            }
           // code_gen->TheJIT->get()->addModule(std::move(*(code_gen->TheModule)));
           // code_gen->InitializeModuleAndPassManager();
        }
    }
    else{
        source_tree.nextToken();
    }
}
void Driver::HandleClassDeclaration(ASTTree & source_tree, CodeGenerator * code_gen){
    if(auto ClassAST = source_tree.ParseClassDef()){
        if(auto *ClassIR = ClassAST->codegen()){
            if(showCode){
                fprintf(stderr, "Read class definition:");
                ClassIR->print(llvm::errs());
                fprintf(stderr, "\n");
            }
            //code_gen->TheJIT->get()->addModule(std::move(*(code_gen->TheModule)));
            //code_gen->InitializeModuleAndPassManager();
            (*(code_gen->Classes))[ClassAST->getName()] = std::move(ClassAST);
        }
    }
    else{
        source_tree.nextToken();
    }
}

void Driver::HandleExtern(ASTTree & source_tree,CodeGenerator * code_gen){
    if(auto ProtoAST = source_tree.ParseExtern()){
        if(auto *FnIR = ProtoAST->codegen()){
            if(showCode == true){
                fprintf(stderr, "Read extern: ");
                FnIR->print(llvm::errs());
                fprintf(stderr, "\n");
            }
            (*(code_gen->FunctionProtos))[ProtoAST->getName()] = std::move(ProtoAST); 
        }
    }
    else{
        source_tree.nextToken();
    }
}

void Driver::HandleImport(ASTTree & source_tree, std::string fileLocation){
	if(auto ImportAST = source_tree.ParseImport()){
		fileLocation = ParseOutFileName(fileLocation);
		ImportAST->prependFileLocation(fileLocation);
		ImportAST->codegen(showCode);
	}
	else{
		source_tree.nextToken();
	}
}

void Driver::HandleTopLevelExpression(ASTTree & source_tree){
    if(auto FnAST = source_tree.ParseTopLevelExpr()){
        if(FnAST->codegen()){
           // auto H = code_gen->TheJIT->get()->addModule(std::move(*(code_gen->TheModule)));
           // code_gen->InitializeModuleAndPassManager();

           // auto ExprSymbol = code_gen->TheJIT->get()->findSymbol("__anon__expr");
           // assert(ExprSymbol && "Function not found");
           // double (*FP)() = (double(*)())(intptr_t)llvm::cantFail(ExprSymbol.getAddress());
            //fprintf(stderr,"\nTop Level Expression Evaluated to %f \n",FP());
            //code_gen->TheJIT->get()->removeModule(H);
        }
    }
    else{
        source_tree.nextToken();
    }
}

