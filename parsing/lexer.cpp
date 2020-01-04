#include "lexer.h"
#include <vector>
#include <iostream>

std::map<std::string,std::string> keywords_list = {
    {"int","data_int"},
    {"bool","data_boolean"},
    {"char","data_character"},
    {"string","data_string"},
    //May insert partial type inferencing to kill float but we shall see
    {"float","data_float"},
    {"void","data_void"},
    {"extern","extern"},
    {"if","if"},
    {"else","else"},
    {"then","then"},
    {"for","for"},
    {"in","in"},
    {"binary","binary"},
    {"unary","unary"},
    {"var","var"},
    {"return","return"}
    
};

void tokenize_file(ProgramFile & source_file){
    std::string char_stack = "";
    int line_num = 0;
    int char_number = 0;
    std::vector<char> current_line = source_file.GetLine(0);
    while(current_line.size() != 0){
        char_number = 0;
        while(char_number < (int)current_line.size()){
            char_stack += current_line.at(char_number);
            if(char_stack[0] == ' '){
                char_stack = "";
            }
            else if(isNumber(char_stack[0])){
                std::string num_type = loadNumberToken(current_line,char_stack,char_number);
                source_file.AddToken(num_type,char_stack);
                char_stack = "";
            }
            else if(isLegalLetter(char_stack[0])){
                loadLetterToken(current_line,char_stack,char_number);
                std::string type = findKeyword(char_stack); 
                if(type == ""){type = "identifier";}
                source_file.AddToken(type,char_stack);
                char_stack="";
            }
            //We may want to put this in our parser but I will just ignore comment in lexer
            else if(isOneLineComment(current_line,char_stack,char_number)){
                char_number = current_line.size();
                char_stack="";
                break;
            }
            else if(isMultiLineComment(current_line,char_stack,char_number)){
                char_stack = "";
                while(current_line.size() != 0){
                    if(char_number+1 >= (int)current_line.size()){
                        char_number = 0;
                        line_num++;
                        current_line = source_file.GetLine(line_num);
                        continue;
                    }
                    if(current_line.at(char_number) == '*' && current_line.at(char_number+1) == '/'){
                        break;
                    }
                    char_number++;

                }
                char_number+=1;
                char_stack="";
            }
            else if(isOperator(char_stack[0])){
                if(current_line.at(char_number+1) == '='){
                    char_stack += current_line.at(char_number+1);
                    source_file.AddToken("operator",char_stack);
                    char_number++;
                }
                else if((current_line.at(char_number+1) == char_stack[0]) && (char_stack[0] == '&' || char_stack[0] == '|')){
                    char_stack += current_line.at(char_number+1);
                    source_file.AddToken("operator",char_stack);
                    char_number++;
                }
                
                else{
                    source_file.AddToken("operator",char_stack);
                }
                char_stack="";
            }
            else if(char_stack[0] == ';'){
                source_file.AddToken("semicolon",char_stack);
                char_stack="";
            }
            else if(char_stack[0] == '\'' || char_stack[0] == '\"'){
                std::string str = loadStringToken(source_file,line_num,char_number);
                source_file.AddToken("string",str);
                char_stack="";
                current_line = source_file.GetLine(line_num);
            }
            else if(isSpecialChar(char_stack[0])){
                std::string type = loadSpecialToken(char_stack[0]);
                source_file.AddToken(type,char_stack);
                char_stack="";
            }  
            char_number++;
        }
        char_stack="";

        line_num++;
        current_line = source_file.GetLine(line_num);
    }
}
bool isNumber(char first_char){
    if(first_char >= '0' && first_char <= '9'){return true;}
    return false;
}
std::string loadNumberToken(std::vector<char> current_line, std::string & char_stack , int & char_number){
    std::string type = "int";
    char_number++;
    if(char_number >= (int)current_line.size()){ char_number--; return type;}
    char current_char = current_line.at(char_number);
    char_number++;
    while(char_number < (int)current_line.size() && (isNumber(current_char) || current_char == '.')){
        if(current_char == '.'){
            type="float";
        }
        char_stack += current_char;
        current_char = current_line.at(char_number);
        char_number++;
    }
    char_number-=2;
    return type;
}

bool isLegalLetter(char letter){
    if((letter <= 'Z' && letter >= 'A' ) || (letter <= 'z' && letter >= 'a')){return true;}
    return false;
}
bool isIdentifierLegal(char ch){
    if(isLegalLetter(ch)){return true;}
    if(isNumber(ch)){return true;}
    if(ch == '_'){return true;}
    return false;
}
void loadLetterToken(std::vector<char> current_line, std::string & char_stack , int & char_number){
    char_number++;
    if(char_number >= (int)current_line.size()){ char_number--; return;}
    char current_char = current_line.at(char_number);
    char_number++;
    while(char_number < (int)current_line.size() && (isIdentifierLegal(current_char))){
        char_stack += current_char;
        current_char = current_line.at(char_number);
        char_number++;
    }
    char_number-=2;
}
bool isOneLineComment(std::vector<char> current_line, std::string & char_stack , int & char_number){
    if(char_number+1 >= (int)current_line.size()){return false;}
    if(current_line.at(char_number) == '/' && current_line.at(char_number+1) == '/'){return true;}
    return false;
}
bool isMultiLineComment(std::vector<char> current_line, std::string & char_stack , int & char_number){
    if(char_number+1 >= (int)current_line.size()){return false;}
    if(current_line.at(char_number) == '/' && current_line.at(char_number+1) == '*'){return true;}
    return false;
}
bool isOperator(char op){
    if(op == '*' || op == '+' || op == '-' || op == ':' || op == '=' || op == '/' || op == '%'  || op == '&' || op == '|' || op == '!' || op == '<' || op == '>' || op == '='){
        return true;
    }
    return false;
}
bool isSpecialChar(char specialChar){
    if(specialChar == '{' || specialChar == '}'){return true;}
    if(specialChar == '(' || specialChar == ')'){return true;}
    if(specialChar == '[' || specialChar == ']'){return true;}
    if(specialChar == '\'' || specialChar == '\"'){return true;}
    if(specialChar == '.'){return true;}
    if(specialChar == ','){return true;}


    return false;
}
std::string loadSpecialToken(char specialChar){
    //TODO Break these up into open_bracket and close_bracket
    if(specialChar == '{' || specialChar == '}'){return "curly_brace";}
    if(specialChar == '(' || specialChar == ')'){return "standard_brace";}
    if(specialChar == '[' || specialChar == ']'){return "square_brace";}
    if(specialChar == ','){return "comma";}
    if(specialChar == '.'){return "dot_accessor";}
    return "N/A";
}
std::string loadStringToken(ProgramFile source_file, int & line_number, int & char_number){
    std::string char_stack = "";
    std::vector<char> current_line = source_file.GetLine(line_number);
    char init_char = current_line.at(char_number);
    char_number++;
    char current_char = current_line.at(char_number);
    while(current_char != init_char){
        char_stack += current_char;
        char_number++;
        if(char_number >= (int)current_line.size()){
            line_number++;
            current_line = source_file.GetLine(line_number);
            char_number = 0;
        }
        current_char = current_line.at(char_number);
    }
    return char_stack;

}
std::string findKeyword(std::string keyword){
    return keywords_list[keyword];
}
