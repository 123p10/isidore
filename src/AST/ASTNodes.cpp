#include "ASTNodes.h"
#include "llvm/IR/Constants.h"
#include "llvm/ADT/APFloat.h"
#include <iostream>
#include <fstream>
#include "llvm/IR/Type.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Verifier.h"
#include "../code_generation/code_gen.h"
#include "llvm/IR/InstrTypes.h"
#include "ASTTree.h"
#include "../utils/StringUtils.h"
NumberExprAST::NumberExprAST(std::string numString, CodeGenerator * code_gen){
    Val = stod(numString);
    (*this).code_gen = code_gen;
}

VariableExprAST::VariableExprAST(const std::string &Name, CodeGenerator * code_gen){
    (*this).Name = Name;
    (*this).code_gen = code_gen;
}
BinaryExprAST::BinaryExprAST(std::string op, std::unique_ptr<ExprAST> LHS, std::unique_ptr<ExprAST> RHS, CodeGenerator * code_gen){
    Op = op;
    (*this).LHS = std::move(LHS);
    (*this).RHS = std::move(RHS);
    (*this).code_gen = code_gen;
}
IfExprAST::IfExprAST(std::unique_ptr<ExprAST> Cond,std::vector<std::unique_ptr<ExprAST>> Then, std::vector<std::unique_ptr<ExprAST>> ElseThen, CodeGenerator * code_gen){
    (*this).Cond = std::move(Cond);
    (*this).ThenList = std::move(Then);
    (*this).ElseThenList = std::move(ElseThen);
    (*this).code_gen = code_gen;
}
ReturnExprAST::ReturnExprAST(std::unique_ptr<ExprAST> returnExpr,CodeGenerator * code_gen){
    (*this).returnExpr = std::move(returnExpr);
    (*this).code_gen = code_gen;
    (*this).isReturn = true;
}
VarExprAST::VarExprAST(std::vector<std::pair<std::string, std::unique_ptr<ExprAST>>> VarNames, llvm::Type * type,  CodeGenerator * code_gen, bool isAbstract, std::unique_ptr<ExprAST> size){
    (*this).VarNames = std::move(VarNames);
    (*this).type = std::move(type);
    (*this).code_gen = code_gen;
    (*this).isAbstractType = isAbstract;
    (*this).size = std::move(size);
}

FunctionAST::FunctionAST(std::unique_ptr<PrototypeAST> Proto,
    std::vector<std::unique_ptr<ExprAST>> Body, CodeGenerator * code_gen){
    (*this).Proto = std::move(Proto);
    (*this).Body = std::move(Body);
    (*this).code_gen = code_gen;
}
//Code_gen
//To improve this remove these persistent references to getContext or getModule, replace with temp variables or better method, pointers

llvm::Value * ExprAST::getAlloca(){
	return LogErrorV("Improper Address Request");
}

llvm::Value *NumberExprAST::codegen(){
    return llvm::ConstantFP::get(*(code_gen->TheContext),llvm::APFloat(Val));
}
llvm::Value *VariableExprAST::codegen(){
    llvm::Value *V = code_gen->NamedValues[Name].value;
    if(!V){
        LogErrorV("Unknown Variable Name");
    }
    return code_gen->Builder->CreateLoad(V,Name.c_str());
}
llvm::Value * VariableExprAST::getAlloca(){
    return code_gen->NamedValues[getName()].value;
}
llvm::Value *UnaryExprAST::codegen(){
    if(Opcode == "&"){
    	return Operand->getAlloca();
    }
    llvm::Value *OperandV = Operand->codegen();
    if(!OperandV){
        return nullptr;
    }
    if(Opcode == "-"){
        return code_gen->Builder->CreateFSub(llvm::ConstantFP::get(*(code_gen->TheContext),llvm::APFloat(0.0)),OperandV, "subtmp");
    }
    else{
        llvm::Function *F = code_gen->getFunction(std::string("unary") + Opcode);
        if(!F){
            return LogErrorV("Unknown unary operator");
        }
        return code_gen->Builder->CreateCall(F,OperandV,"unop");
    }
}

llvm::Value *BinaryExprAST::getAlloca(){
	if(Op == "."){
	    VariableExprAST *RHSE = static_cast<VariableExprAST*>(RHS.get());
		std::string R = RHSE->getName();
		VariableExprAST *LHSE = static_cast<VariableExprAST*>(LHS.get());
		std::unique_ptr<ClassAccessorAST> gen = std::make_unique<ClassAccessorAST>(code_gen,LHSE,R);
		return gen->getAlloca();
	}
	return LogErrorV("Tried to get an Alloca of an improper value");
}

llvm::Value *BinaryExprAST::codegen() {
    if(Op == "=" || Op == "+=" || Op == "-=" || Op == "*=" || Op == "/="){
        ExprAST *LHSE = LHS.get();
        if(!LHSE){
            return LogErrorV("destination of '=' must be a variable");
        }
        llvm::Value *Val = RHS->codegen();
        if(!Val){
            return nullptr;
        }
        llvm::Value *Variable = LHSE->getAlloca();
        llvm::Value *variable_value = LHSE->codegen();
		if(!Val->getType()->isPointerTy()){
			Val = code_gen->typeManager->castToType(Val,variable_value->getType());
		}

        if(!Variable){
            return LogErrorV("Unknown Variable name");
        }
        else if(Op == "+="){
            Val = code_gen->operator_instructions("Add",variable_value,Val);
        }
        else if(Op == "-="){
            Val = code_gen->operator_instructions("Subtract",variable_value,Val);
        }
        else if(Op == "*="){
            Val = code_gen->operator_instructions("Multiply",variable_value,Val);
        }
        else if(Op == "/="){
            Val = code_gen->operator_instructions("Divide",variable_value,Val);
        }
		code_gen->Builder->CreateStore(Val, Variable);

        return Val;
    }

	if(Op == "."){
		VariableExprAST *RHSE = static_cast<VariableExprAST*>(RHS.get());
		std::string R = RHSE->getName();
		VariableExprAST *LHSE = static_cast<VariableExprAST*>(LHS.get());
		std::unique_ptr<ClassAccessorAST> gen = std::make_unique<ClassAccessorAST>(code_gen,LHSE,R);
		return gen->codegen();
	}

    llvm::Value *L = LHS->codegen();
    llvm::Value *R = RHS->codegen();
    if (!L || !R)
        return nullptr;
    if(Op == "+"){
        return code_gen->operator_instructions("Add",L,R);
    }
    else if(Op == "-"){
        return code_gen->operator_instructions("Subtract",L,R);
    }
    else if(Op == "*"){
        return code_gen->operator_instructions("Multiply",L,R);
    }
    else if(Op == "/"){
        return code_gen->operator_instructions("Divide",L,R);
    }
    else if(Op == "%"){
        return code_gen->operator_instructions("Remainder",L,R);
    }
    else if(Op == "<"){
        return code_gen->operator_instructions("LessThan",L,R);
    }
    else if(Op == ">"){
        return code_gen->operator_instructions("GreaterThan",L,R);
    }
    else if(Op == "=="){
        return code_gen->operator_instructions("CheckEquality",L,R);
    }
    else if(Op == ">="){
        return code_gen->operator_instructions("GreaterThanEqualTo",L,R);
    }
    else if(Op == "<="){
        return code_gen->operator_instructions("LessThanEqualTo",L,R);
    }
    else if(Op == "!="){
        return code_gen->operator_instructions("NotEqual",L,R);
    }
    else if(Op == "&&"){
        return code_gen->operator_instructions("And",L,R);
    }
    else if(Op == "||"){
        return code_gen->operator_instructions("Or",L,R);
    }

    else{
        llvm::Function *F = code_gen->getFunction(std::string("binary") + Op);
        assert(F && "binary operator not found!");
        llvm::Value *Ops[2] = {L, R};
        return code_gen->Builder->CreateCall(F,Ops,"binop");
    }
}
llvm::Value *CallExprAST::codegen(){
    llvm::Function *CalleeF = code_gen->getFunction(Callee);
    if(!CalleeF){
        return LogErrorV("Unknown Function Referenced");
    }
    if(CalleeF->arg_size() != Args.size()){
        return LogErrorV("Incorrect # of arguments passed");
    }
    std::vector<llvm::Value *> ArgsV;
    int i = 0;
    for(auto &Arg : CalleeF->args()){
		llvm::Value * argExpr;
		if(Arg.getType()->isPointerTy()){
			//This seems weird but we use it for implicit pass by reference
			argExpr = Args[i]->getAlloca();
		}
		else{
			argExpr = Args[i]->codegen();
		}
        argExpr = code_gen->typeManager->castToType(argExpr,Arg.getType());
        ArgsV.push_back(argExpr);
        if(!ArgsV.back()){
            return nullptr;
        }
        i++;
        if(i >= (int)Args.size()){
            break;
        }
    }
    return code_gen->Builder->CreateCall(CalleeF,ArgsV,"calltmp");
}
llvm::Value *IfExprAST::codegen(){
    llvm::Value *CondV = Cond->codegen();
    if(!CondV){
        return nullptr;
    }
    CondV = code_gen->Builder->CreateICmpNE(CondV, llvm::ConstantInt::get(*code_gen->TheContext,llvm::APInt(1,0,false)),"ifcond");
    llvm::Function *TheFunction = code_gen->Builder->GetInsertBlock()->getParent();
    
    llvm::BasicBlock *ThenBB = llvm::BasicBlock::Create(*code_gen->TheContext,"then");
    llvm::BasicBlock *ElseBB = llvm::BasicBlock::Create(*code_gen->TheContext,"else");
    llvm::BasicBlock *MergeBB = llvm::BasicBlock::Create(*code_gen->TheContext,"ifcont");
    TheFunction->getBasicBlockList().push_back(ThenBB);
    code_gen->Builder->CreateCondBr(CondV, ThenBB, ElseBB);
    code_gen->Builder->SetInsertPoint(ThenBB);
    bool hasReturn = false;
    for(std::vector<std::unique_ptr<ExprAST>>::iterator it = ThenList.begin(); it != ThenList.end(); ++it) {
        it->get()->codegen();
        if(it->get()->isReturn == true){
            hasReturn = true;
            break;
        }
    }
    if(!hasReturn){
        code_gen->Builder->CreateBr(MergeBB);
    }
    ThenBB = code_gen->Builder->GetInsertBlock();
    TheFunction->getBasicBlockList().push_back(ElseBB);
    code_gen->Builder->SetInsertPoint(ElseBB);
    hasReturn = false;
    for(std::vector<std::unique_ptr<ExprAST>>::iterator it = ElseThenList.begin(); it != ElseThenList.end(); ++it) {
        it->get()->codegen();
        if(it->get()->isReturn == true){
            hasReturn = true;
            break;
        }
    }
    if(!hasReturn){
        code_gen->Builder->CreateBr(MergeBB);
    }
    ElseBB = code_gen->Builder->GetInsertBlock();
    TheFunction->getBasicBlockList().push_back(MergeBB);
    code_gen->Builder->SetInsertPoint(MergeBB);
    return llvm::ConstantFP::get(*(code_gen->TheContext),llvm::APFloat(0.0));
}

llvm::Value *ForExprAST::codegen(){
    llvm::Function *TheFunction = code_gen->Builder->GetInsertBlock()->getParent();
    llvm::Value *StartVal = Start->codegen();
    if(!StartVal){
        return nullptr;
    }

    llvm::BasicBlock *LoopBB = llvm::BasicBlock::Create(*code_gen->TheContext, "loop", TheFunction);

    code_gen->Builder->CreateBr(LoopBB);

    code_gen->Builder->SetInsertPoint(LoopBB);

    for(std::vector<std::unique_ptr<ExprAST>>::iterator it = BodyList.begin(); it != BodyList.end(); ++it) {
        it->get()->codegen();
        if(it->get()->isReturn == true){
            break;
        }
    }

    llvm::Value *StepVal = nullptr;
    if(Step){
        StepVal = Step->codegen();
        if(!StepVal){
            return nullptr;
        }
    }

    llvm::Value *EndCond = End->codegen();
    if(!EndCond){
        return nullptr;
    }
    EndCond = code_gen->Builder->CreateICmpNE(EndCond,llvm::ConstantInt::get(*code_gen->TheContext,llvm::APInt(1,0)),"loopcond");

    llvm::BasicBlock *AfterBB = llvm::BasicBlock::Create(*code_gen->TheContext,"afterloop",TheFunction);
    code_gen->Builder->CreateCondBr(EndCond, LoopBB, AfterBB);
    code_gen->Builder->SetInsertPoint(AfterBB);

    return llvm::Constant::getNullValue(llvm::Type::getDoubleTy(*code_gen->TheContext));
}

llvm::Value *VarExprAST::codegen(){
    llvm::Function *TheFunction = code_gen->Builder->GetInsertBlock()->getParent();
    std::vector<Variable> OldBindings;
    if(isAbstractType && size != nullptr){
        int size_int = 0;
        llvm::ConstantInt* size_gen = static_cast<llvm::ConstantInt*>(code_gen->typeManager->castToType(size->codegen(),llvm::Type::getInt64Ty(*code_gen->TheContext)));
        size_int = size_gen->getValue().getZExtValue();
        type = llvm::ArrayType::get(type,size_int);
    }
    for(unsigned i = 0, e = VarNames.size(); i != e;++i){
        const std::string &VarName = VarNames[i].first;
        ExprAST *Init = VarNames[i].second.get();

        llvm::Value *InitVal;
        if(Init){
            InitVal = Init->codegen();
            if(!InitVal){
                return nullptr;
            }
        }
        else{
            if(type->isDoubleTy()){
                InitVal = llvm::ConstantFP::get(*code_gen->TheContext,llvm::APFloat(0.0));
            }
            else if(type->isIntegerTy()){
                InitVal = llvm::ConstantInt::get(*code_gen->TheContext,llvm::APInt(64,0));
            }
        }
        llvm::AllocaInst *Alloca;
        OldBindings.push_back(code_gen->NamedValues[VarName]); 
		if(!isAbstractType){
			Alloca = code_gen->CreateEntryBlockAlloca(TheFunction,type,VarName);	
            InitVal = code_gen->typeManager->castToType(InitVal,type);
            code_gen->Builder->CreateStore(InitVal, Alloca);
        }
		else if(size != nullptr){
			Alloca = code_gen->CreateEntryBlockAlloca(TheFunction,type,VarName);
		}
		else{
			//This is about to get ugly, we need to look into this if there are
			//variable length structs
			//llvm::AllocaInst *StorageAlloca = code_gen->CreateEntryBlockAlloca(TheFunction,static_cast<llvm::PointerType*>(type)->getElementType(),VarName);;
			llvm::Value * index_list[1];
			index_list[0] = llvm::ConstantInt::get(*(code_gen->TheContext),llvm::APInt(8,1));
			llvm::ArrayRef<llvm::Value *> indices(index_list);	
			
			llvm::Value * sizeOfAbstract = code_gen->Builder->CreatePtrToInt(code_gen->Builder->CreateGEP(llvm::ConstantPointerNull::get(static_cast<llvm::PointerType*>(type)),indices),llvm::Type::getInt8Ty(*(code_gen->TheContext)));
			std::vector<std::unique_ptr<ExprAST>> size_list;
			size_list.push_back(std::make_unique<ValueAsExprAST>(sizeOfAbstract));
			std::unique_ptr<CallExprAST> objMallocCall = std::make_unique<CallExprAST>("GC_malloc",std::move(size_list),code_gen);
			llvm::Value * objLocationGC = objMallocCall->codegen();

			objLocationGC = code_gen->Builder->CreatePointerCast(objLocationGC, type);

			llvm::AllocaInst *PointerAlloca = code_gen->CreateEntryBlockAlloca(TheFunction,type,VarName + "__ptr");
			code_gen->Builder->CreateStore(objLocationGC,PointerAlloca);
			Alloca = PointerAlloca;
		}
        code_gen->NamedValues[VarName] = Variable{Alloca,type};
    }
    return llvm::ConstantFP::get(*(code_gen->TheContext),llvm::APFloat(0.0));
}


llvm::Function *PrototypeAST::codegen(){
    std::vector<llvm::Type*> argTypes;
    for(int i = 0; i < (int)Args.size();i++){
        argTypes.push_back(Args.at(i).type);
    }
    llvm::FunctionType *FT = llvm::FunctionType::get(std::move(type),argTypes,false);
    llvm::Function *F = llvm::Function::Create(FT, llvm::Function::ExternalLinkage,Name,code_gen->TheModule->get());
    unsigned Idx = 0;
    for(auto &Arg : F->args()){
        Arg.setName(Args[Idx++].name);
    }
    return F;
}

llvm::Function *FunctionAST::codegen(){
    auto &P = *Proto;
    (*(code_gen->FunctionProtos))[Proto->getName()] = std::move(Proto);
    llvm::Function *TheFunction = code_gen->getFunction(P.getName());
    if(!TheFunction){
        return nullptr;
    }
    if(P.isBinaryOp()){
        code_gen->BinopPrecedence[std::string(1,P.getOperatorName())] = P.getBinaryPrecedence();
    }
    llvm::BasicBlock *BB = llvm::BasicBlock::Create(*(code_gen->TheContext),"entry",TheFunction);
    code_gen->Builder->SetInsertPoint(BB);
    //Maybe we change this
    code_gen->NamedValues.clear();
    for(auto &Arg : TheFunction->args()){
        llvm::AllocaInst *Alloca = code_gen->CreateEntryBlockAlloca(TheFunction,Arg.getType(),Arg.getName().str());
		code_gen->Builder->CreateStore(&Arg,Alloca);
       	code_gen->NamedValues[Arg.getName().str()] = Variable{Alloca, Arg.getType()};
		if(Arg.getType()->isPointerTy()){
			llvm::LoadInst *Load = code_gen->Builder->CreateLoad(Alloca);
			code_gen->NamedValues[Arg.getName().str()] = Variable{Load, Arg.getType()->getPointerElementType()};
		}
    }
    if(P.getName() == "__anon__expr"){
        llvm::Value *RetVal = Body.at(0)->codegen();
        code_gen->Builder->CreateRet(RetVal);
    }
    else{
        for(std::vector<std::unique_ptr<ExprAST>>::iterator it = Body.begin(); it != Body.end(); ++it) {
            it->get()->codegen();
            if(it->get()->isReturn == true){
                break;
            }
        }
    }
    llvm::verifyFunction(*TheFunction,&llvm::errs());
    code_gen->TheFPM->get()->run(*TheFunction);
    return TheFunction;

}
std::string FunctionAST::getFnName(){
	return Proto->getName();
}
llvm::Value *ReturnExprAST::codegen(){
    llvm::Value * return_val = returnExpr->codegen();
    llvm::Function *TheFunction = code_gen->Builder->GetInsertBlock()->getParent();
    return_val = code_gen->typeManager->castToType(return_val,TheFunction->getReturnType());
    return code_gen->Builder->CreateRet(return_val);
}

llvm::Value *ArrayElementAST::codegen(){
    return code_gen->Builder->CreateLoad(getAlloca(),(Name + "i").c_str());
}
llvm::Value * ArrayElementAST::getAlloca(){
    llvm::Value *V = code_gen->NamedValues[Name].value;
    if(!V){
        LogErrorV("Unknown Variable Name");
    }
    llvm::Value* index_list[2];
    index_list[1] = code_gen->typeManager->castToType(index->codegen(),llvm::Type::getInt64Ty(*code_gen->TheContext));
    index_list[0] = llvm::ConstantInt::get(*(code_gen->TheContext),llvm::APInt(32,0));
    llvm::ArrayRef<llvm::Value *> indices(index_list);
    llvm::Value* element_value = code_gen->Builder->CreateGEP(V,indices);
    return element_value;
}

llvm::Value *StringLiteralExprAST::codegen(){
    std::vector<llvm::Constant*> chars;
    for(int i = 0;i < (int)str.length();i++){
        chars.push_back(llvm::Constant::getIntegerValue(llvm::Type::getInt8Ty(*code_gen->TheContext),llvm::APInt(8,(int)str[i])));
    }
    return llvm::ConstantArray::get(llvm::ArrayType::get(llvm::Type::getInt8Ty(*code_gen->TheContext),str.length()),chars);
}
llvm::Type *ClassDeclarationAST::codegen(){
    llvm::StructType *myType = llvm::StructType::create(*code_gen->TheContext,identifier);
    std::vector<llvm::Type*> type_list;
    for(int i = 0;i < (int)args.size();i++){
		if(!args.at(i).type){
			type_list.push_back(myType->getPointerTo());
		}
		else{
			type_list.push_back(args.at(i).type);
		}
	}
    myType->setBody(type_list,false);
    (*this).type = myType;
    return getType();
}
int ClassDeclarationAST::indexOfArg(std::string key){
    for(int i = 0;i < (int)args.size();i++){
        if(key == args.at(i).name){
            return i;
        }
    }
    return -1;
}
llvm::Value *ClassAccessorAST::codegen(){	
    llvm::Value * load = code_gen->Builder->CreateLoad(getAlloca(),(Name + "i").c_str());
	return load;
}
llvm::Value * ClassAccessorAST::getAlloca(){
    llvm::Value *V = LHS->codegen();
	llvm::PointerType *pT = static_cast<llvm::PointerType*>(V->getType());
    int index = (*code_gen->Classes)[pT->getElementType()->getStructName().str()]->indexOfArg(accessKey);
    if(!V){
        LogErrorV("Unknown Variable Name");
    }
    llvm::Value* index_list[2];
    index_list[1] = llvm::ConstantInt::get(*(code_gen->TheContext),llvm::APInt(32,index));
    index_list[0] = llvm::ConstantInt::get(*(code_gen->TheContext),llvm::APInt(32,0));
    llvm::ArrayRef<llvm::Value *> indices(index_list);
    llvm::Value* element_value = code_gen->Builder->CreateGEP(V,indices);
    return element_value;
}

void ImportAST::prependFileLocation(std::string prepend){
	(*this).fileLocation = prepend + (*this).fileLocation;
}

void ImportAST::codegen(bool showCode){
	if(code_gen->fileIncluded(fileLocation)){
		return;
	}
	std::ifstream importFs(fileLocation);
	ProgramFile file(importFs);
	tokenize_file(file);
	ASTTree source_tree(file,code_gen);
	if(showCode){
		fprintf(stderr, ("Start Import of: " + fileLocation + " {\n").c_str());
	}
	//Run check for module stuff
	code_gen->addFileToIncluded(fileLocation);
	// We should probably deprecate Driver class and make these all Driver calls
	// I also need to add a dependency tracker to ensure that we do not include the same files twice, and we can handle cyclic loading
	// We should probably make every file a namespace
	while(1){
		if(source_tree.getCurrToken().value == "EOF"){
			break;
		}
		else if(source_tree.isType(source_tree.getCurrToken())){
			if(auto FnAST = source_tree.ParseDefinition()){
				auto Proto = FnAST->getProto();
				for(unsigned int i = 0;i < imports.size();i++){
					if(imports.at(i) == "*" || imports.at(i) == Proto->getName()){
						if(auto *ProtoIR = Proto->codegen()){
							if(showCode){
								fprintf(stderr, "Read prototype definition:");
								ProtoIR->print(llvm::errs());
								fprintf(stderr, "\n");
							}
							(*(code_gen->FunctionProtos))[Proto->getName()] = std::move(Proto); 
						}
						break;
					}
				}
			}
		}
		else if(source_tree.getCurrToken().type == "class"){
			if(auto ClassAST = source_tree.ParseClassDef()){
		        std::string className = ClassAST->getName();
				for(unsigned int i = 0;i < imports.size();i++){
					if(imports.at(i) == "*" || imports.at(i) == className){
						if(auto *ClassIR = ClassAST->codegen()){
							if(showCode){
								fprintf(stderr, "Read class definition:");
								ClassIR->print(llvm::errs());
								fprintf(stderr, "\n");
							}
							(*(code_gen->Classes))[ClassAST->getName()] = std::move(ClassAST);
						}
						break;
					}
				}
			}
		}
		else if(source_tree.getCurrToken().type == "extern"){
			if(auto ExternAST = source_tree.ParseExtern()){
				if(auto *ExternIR = ExternAST->codegen()){
					if(showCode){
						fprintf(stderr, "Read extern: ");
						ExternIR->print(llvm::errs());
						fprintf(stderr, "\n");
					}
					(*(code_gen->FunctionProtos))[ExternAST->getName()] = std::move(ExternAST); 
				}
			}
		}
		else if(source_tree.getCurrToken().type == "import"){
			if(auto ImportAST = source_tree.ParseImport()){
				
				fileLocation = ParseOutFileName(fileLocation);
				if(ImportAST->getFileLocation().length() <= 1 || ImportAST->getFileLocation()[0] != '/'){ 
					ImportAST->prependFileLocation(fileLocation);
				}
				ImportAST->codegen(showCode);
			}
			else{
				source_tree.nextToken();
			}
		}
		else{
			source_tree.nextToken();
		}
	}
	if(showCode){
		fprintf(stderr,("} Ended Import of " + fileLocation + "\n").c_str());
	}
}
