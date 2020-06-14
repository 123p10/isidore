#ifndef FILE_HANDLER_H
#define FILE_HANDLER_H
#include <vector>
#include <istream>
#include "../code_generation/code_gen.h"
struct Token
{
    std::string type;
    std::string value;
};


class ProgramFile{
    private:
        std::vector<std::vector<char>> source_code;
        bool valid = false;
        std::vector<struct Token> token_list; 
    public:
        ProgramFile();
        ProgramFile(std::istream & input_file);
        std::vector<char> GetLine(int index);
        bool IsValid();
        void AddToken(std::string type, std::string value);
        Token GetToken(int index);
        int TokenListSize();
};

#endif
