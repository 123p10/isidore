#include "ASTTree.h"
//I have a feeling this should all be in our program file class??!!


std::map<std::string, int> BinopPrecedence = {
    {"<",10},
    {"+",20},
    {"-",20},
    {"*",40},
};
Token ASTTree::nextToken() {
    (*this).token_i++;
    return getCurrToken();
}
Token ASTTree::getCurrToken(){
    return source_file.GetToken(token_i);
}
ASTTree::ASTTree(){
    //Dear god don't do this
}
ASTTree::ASTTree(ProgramFile source_file){
    (*this).source_file = source_file;
    token_i = 0;
    currToken = (*this).source_file.GetToken(token_i);
}

ASTTree::ASTTree(ProgramFile source_file, CodeGenerator *code_gen){
    (*this).source_file = source_file;
    token_i = 0;
    currToken = (*this).source_file.GetToken(token_i);
    (*this).code_gen = code_gen;
}

std::unique_ptr<ExprAST> ASTTree::ParseNumberExpr() {
    auto Result = llvm::make_unique<NumberExprAST>(getCurrToken().value,code_gen);
    nextToken();
    return std::move(Result);
}

std::unique_ptr<ExprAST> ASTTree::ParseParenExpr() {
    nextToken();
    auto V = ParseExpression();
    if (!V)
        return nullptr;

    if (getCurrToken().value != ")")
        return LogError("expected ')'");
    nextToken();
    return V;
}
std::unique_ptr<ExprAST> ASTTree::ParseIdentifierExpr() {
    std::string IdName = getCurrToken().value;
    nextToken();

    //This is a variable
    if(getCurrToken().value != "("){
        return llvm::make_unique<VariableExprAST>(IdName,code_gen);
    }
    //This is a function
    nextToken();
    std::vector<std::unique_ptr<ExprAST>> args;
    if(getCurrToken().value != ")"){
        while(1){
            if(auto Arg = ParseExpression()){
                args.push_back(std::move(Arg));
            }
            else{
                return nullptr;
            }
            if(getCurrToken().value == ")"){
                break;
            }
            if(getCurrToken().type != "comma"){
                return LogError("Expected ')' or ',' in argument list");
            }
            nextToken();
        }
    }
    nextToken();
    return llvm::make_unique<CallExprAST>(IdName, std::move(args),code_gen);
}

std::unique_ptr<ExprAST> ASTTree::ParsePrimary() {
    if(getCurrToken().type == "identifier"){
        return ParseIdentifierExpr();
    }
    else if(getCurrToken().type == "int" || getCurrToken().type == "float"){
        return ParseNumberExpr();
    }
    else if(getCurrToken().value == "("){
        return ParseParenExpr();
    }
    else{
        return LogError("unknown token when resolving expression");
    }
}
int ASTTree::GetTokPrecedence(){
    int tokPrec = BinopPrecedence[getCurrToken().value];
    if(tokPrec <= 0){return -1;}
    return tokPrec;
}

std::unique_ptr<ExprAST> ASTTree::ParseExpression() {
  auto LHS = ParsePrimary();
  if (!LHS)
    return nullptr;

  return ParseBinOpRHS(0, std::move(LHS));
}
std::unique_ptr<ExprAST> ASTTree::ParseBinOpRHS(int ExprPrec,std::unique_ptr<ExprAST> LHS){
    while(1){
        int tokPrec = GetTokPrecedence();
        if(tokPrec < ExprPrec){
            return LHS;
        }
        Token binOp = getCurrToken();
        nextToken();
        auto RHS = ParsePrimary();
        if(!RHS){
            return nullptr;
        }
        int nextPrec = GetTokPrecedence();
        if(tokPrec < nextPrec){
            RHS = ParseBinOpRHS(tokPrec+1, std::move(RHS));
            if(!RHS){
                return nullptr;
            }
        }
        LHS = llvm::make_unique<BinaryExprAST>(binOp.value,std::move(LHS),std::move(RHS),code_gen);

    }
}
std::unique_ptr<PrototypeAST> ASTTree::ParsePrototype() {
    if (getCurrToken().type != "identifier")
        return LogErrorP("Expected function name in prototype");

    std::string FnName = getCurrToken().value;
    nextToken();
    if (getCurrToken().value != "(")
        return LogErrorP("Expected '(' in prototype");

    // Read the list of argument names.
    std::vector<std::string> ArgNames;
    while (nextToken().type == "identifier"){
        ArgNames.push_back(getCurrToken().value);
    }
    if (getCurrToken().value != ")"){
        return LogErrorP("Expected ')' in prototype");
    }
    // success.
    nextToken();
    return llvm::make_unique<PrototypeAST>(FnName, std::move(ArgNames),code_gen);
}
std::unique_ptr<FunctionAST> ASTTree::ParseDefinition() {
    nextToken();
    auto Proto = ParsePrototype();
    if (!Proto) return nullptr;

    if (auto E = ParseExpression())
        return llvm::make_unique<FunctionAST>(std::move(Proto), std::move(E),code_gen);
    return nullptr;
}
std::unique_ptr<PrototypeAST> ASTTree::ParseExtern() {
  nextToken();
  return ParsePrototype();
}
std::unique_ptr<FunctionAST> ASTTree::ParseTopLevelExpr() {
  if (auto E = ParseExpression()) {
    auto Proto = llvm::make_unique<PrototypeAST>("", std::vector<std::string>(),code_gen);
    return llvm::make_unique<FunctionAST>(std::move(Proto), std::move(E),code_gen);
  }
  return nullptr;
}
std::unique_ptr<ExprAST> LogError(const char *Str) {
  fprintf(stderr, "LogError: %s\n", Str);
  return nullptr;
}
std::unique_ptr<PrototypeAST> LogErrorP(const char *Str) {
  LogError(Str);
  return nullptr;
}

