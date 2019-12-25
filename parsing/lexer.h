#ifndef LEXER_H
#define LEXER_H
#include "../files/file_handler.h"
#include <map> 
//TODO implement case insensitivity

void tokenize_file(ProgramFile & source_file);
bool isNumber(char first_char);
std::string loadNumberToken(std::vector<char> current_line, std::string & char_stack , int & char_number);
bool isLegalLetter(char letter);
void loadLetterToken(std::vector<char> current_line, std::string & char_stack , int & char_number);
bool isComment(std::vector<char> current_line, std::string & char_stack , int & char_number);
bool isOperator(char op);
bool isSpecialChar(char specialchar);
std::string loadSpecialToken(char specialChar);
std::string loadStringToken(ProgramFile source_file, int & line_number, int & char_number);
std::string findKeyword(std::string keyword);
bool isIdentifierLegal(char ch);

#endif
/*
    int [0-9]
    identifier ([a-z]|[A-Z])* but like only chars and numbers
*/