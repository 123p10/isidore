#include "ASTTree.h"
//I have a feeling this should all be in our program file class??!!


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
    else if(getCurrToken().type == "if"){
        return ParseIfExpr();
    }
    else if(getCurrToken().type == "for"){
        return ParseForExpr();
    }
    else if(getCurrToken().type == "var"){
        return ParseVarExpr();
    }
    else if(getCurrToken().type == "return"){
        return ParseReturnExpr();
    }
    else{
        return LogError("unknown token when resolving expression");
    }
}
int ASTTree::GetTokPrecedence(){
    int tokPrec = code_gen->BinopPrecedence[getCurrToken().value];
    if(tokPrec <= 0){return -1;}
    return tokPrec;
}

std::unique_ptr<ExprAST> ASTTree::ParseExpression() {
  auto LHS = ParseUnary();
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
        auto RHS = ParseUnary();
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
    std::string FnName;
    unsigned Kind = 0; //0-iden, 1=unary, 2=binary
    unsigned BinaryPrecedence = 30;
    if(getCurrToken().type == "identifier"){
        FnName = getCurrToken().value;
        Kind = 0;
        nextToken();
    }
    else if(getCurrToken().type == "unary"){
        nextToken();
        FnName = "unary";
        FnName += getCurrToken().value;
        Kind = 1;
        nextToken();
    }
    else if(getCurrToken().type == "binary"){
        nextToken();
        FnName = "binary";
        FnName += getCurrToken().value;
        Kind = 2;
        nextToken();
        if(getCurrToken().type == "int" || getCurrToken().type == "float"){
            if(std::stod(getCurrToken().value) < 1 || std::stod(getCurrToken().value) > 100){
                return LogErrorP("Invalid precedence: must be >1 and <100");
            }
            BinaryPrecedence = (unsigned)std::stod(getCurrToken().value);
            nextToken();
        }
    }
    else{
        return LogErrorP("Expected function name in Prototype");
    }
    if(getCurrToken().value != "("){
        return LogErrorP("Expected '(' in prototype");
    }
    std::vector<std::string> ArgNames;
    while(nextToken().type == "identifier"){
        ArgNames.push_back(getCurrToken().value);
        if(nextToken().value != ","){
            break;
        }
    }
    if(getCurrToken().value != ")"){
        return LogErrorP("Expected ')' in prototype");
    }
    nextToken();
    if(Kind && ArgNames.size() != Kind){
        return LogErrorP("Invalid number of operands for operator");
    }
    return llvm::make_unique<PrototypeAST>(FnName,std::move(ArgNames),code_gen,Kind != 0, BinaryPrecedence);
}
std::unique_ptr<FunctionAST> ASTTree::ParseDefinition() {
    nextToken();
    auto Proto = ParsePrototype();
    if (!Proto) return nullptr;
    if(getCurrToken().value != "{"){
        LogErrorP("Missing semi-colon");
        return nullptr;
    }
    nextToken();
    std::vector<std::unique_ptr<ExprAST>> functionStatements = ParseStatementList();
    return llvm::make_unique<FunctionAST>(std::move(Proto), std::move(functionStatements),code_gen);
    //return nullptr;
}
std::unique_ptr<PrototypeAST> ASTTree::ParseExtern() {
  nextToken();
  return ParsePrototype();
}
std::unique_ptr<FunctionAST> ASTTree::ParseTopLevelExpr() {
  if (auto E = ParseExpression()) {
    std::vector<std::unique_ptr<ExprAST>> statement;
    statement.push_back(std::move(E));
    auto Proto = llvm::make_unique<PrototypeAST>("__anon__expr", std::vector<std::string>(),code_gen);
    return llvm::make_unique<FunctionAST>(std::move(Proto), std::move(statement),code_gen);
  }
  return nullptr;
}
std::unique_ptr<ExprAST> ASTTree::ParseIfExpr(){
    nextToken();
    auto Cond = ParseExpression();
    if(!Cond){
        return nullptr;
    }
    if(getCurrToken().type != "curly_brace"){
        return LogError("expected '{'");
    }
    nextToken();
    std::vector<std::unique_ptr<ExprAST>> thenList = ParseStatementList();
    if(getCurrToken().type != "else"){
        return LogError("expected else");
    }
    if(nextToken().type != "curly_brace"){
        return LogError("expected '{'");
    }
    nextToken();
    std::vector<std::unique_ptr<ExprAST>> elseThenList = ParseStatementList();
    return llvm::make_unique<IfExprAST>(std::move(Cond),std::move(thenList),std::move(elseThenList),code_gen);
}
std::unique_ptr<ExprAST> ASTTree::ParseForExpr(){
    nextToken();
    if(getCurrToken().type != "identifier"){
        return LogError("expected identifier after for");
    }
    std::string IdName = getCurrToken().value;
    if(nextToken().value != "="){
        return LogError("expected '=' after for");
    }
    nextToken();
    auto Start = ParseExpression();
    if(!Start){
        return nullptr;
    }
    if(getCurrToken().value != ","){
        return LogError("expected ',' after for init value");
    }
    nextToken();
    auto End = ParseExpression();
    if(!End){
        return nullptr;
    }
    std::unique_ptr<ExprAST> Step;
    if(getCurrToken().value == ","){
        nextToken();
        Step = ParseExpression();
        if(!Step){
            return nullptr;
        }
    }
    if(getCurrToken().type != "in"){
        return LogError("expected 'in' after for");
    }
    nextToken();
    auto Body = ParseExpression();
    if(!Body){
        return nullptr;
    }
    return llvm::make_unique<ForExprAST>(IdName,std::move(Start),std::move(End),std::move(Step),std::move(Body),code_gen);
}
std::unique_ptr<ExprAST> ASTTree::ParseUnary(){
    if((getCurrToken().type != "operator") || getCurrToken().value == "(" || getCurrToken().value == ","){
        return ParsePrimary();
    }
    std::string Opc = getCurrToken().value;
    nextToken();
    if(auto Operand = ParseUnary()){
        return llvm::make_unique<UnaryExprAST>(Opc, std::move(Operand),code_gen);
    }
    return nullptr;
}
std::unique_ptr<ExprAST> ASTTree::ParseVarExpr(){
    nextToken();
    std::vector<std::pair<std::string, std::unique_ptr<ExprAST>>> VarNames;

    if(getCurrToken().type != "identifier"){
        return LogError("expected identifier after var");
    }
    while(1){
        std::string Name = getCurrToken().value;
        nextToken();
        std::unique_ptr<ExprAST> Init;
        if(getCurrToken().value == "="){
            nextToken();
            Init = ParseExpression();
            if(!Init){return nullptr;}
        }
        VarNames.push_back(std::make_pair(Name, std::move(Init)));

        if(getCurrToken().value != ","){break;}
        nextToken();
        if(getCurrToken().type != "identifier"){return LogError("expected identifier list after var");}
    }
    return llvm::make_unique<VarExprAST>(std::move(VarNames),code_gen);
}

std::unique_ptr<ExprAST> ASTTree::ParseReturnExpr(){
    nextToken();
    if(auto returnExpr = ParseExpression()){
        return llvm::make_unique<ReturnExprAST>(std::move(returnExpr),code_gen);
    }
    LogErrorP("Error in Return Expression");
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

std::vector<std::unique_ptr<ExprAST>> ASTTree::ParseStatementList(){
    std::vector<std::unique_ptr<ExprAST>> statementList;
    while(getCurrToken().value != "}"){
        std::unique_ptr<ExprAST> statement = ParseExpression();
        if(!statement){
            LogError("Expression failed to parse");
            break;
        }
        if(getCurrToken().type != "semicolon"){
            LogError("expected ';'");
            break;
        }
        nextToken(); // eat ;
        statementList.push_back(std::move(statement));
    }
    nextToken();
    return statementList;
}