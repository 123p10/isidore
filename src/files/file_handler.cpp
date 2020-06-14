#include <iostream>
#include <sstream>
#include <fstream>
#include <iterator>
#include <algorithm>

#include "file_handler.h"
ProgramFile::ProgramFile(){
    
}
ProgramFile::ProgramFile(std::istream & input_file){
    if(!input_file){
        std::cout << "File failed to open";
        valid = false;
        return;
    }
    std::string current_line;
    while(std::getline(input_file,current_line)){
        std::vector<char> temp_line(current_line.begin(),current_line.end());
        temp_line.push_back('\n');
        source_code.push_back(temp_line);
    }
    valid = true;
}
std::vector<char> ProgramFile::GetLine(int index){
    if(index >= (int)source_code.size()){return std::vector<char>();}
    return source_code.at(index);
}
bool ProgramFile::IsValid(){
    return valid;
}

void ProgramFile::AddToken(std::string type, std::string value){
    struct Token temp_token = {
        type,
        value,
    };
    token_list.push_back(temp_token);
}
Token ProgramFile::GetToken(int index){
    if(index >= TokenListSize()){return Token{"EOF","EOF"};}
    return token_list.at(index);
}
int ProgramFile::TokenListSize(){
    return token_list.size();
}
