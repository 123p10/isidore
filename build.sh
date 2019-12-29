g++ -g -O0 -rdynamic -pipe -Wall \
                files/file_handler.cpp \
                parsing/lexer.cpp \
                test_lexer.cpp \
                driver/main_driver.cpp \
                AST/ASTNodes.cpp \
                AST/ASTTree.cpp \
                code_generation/code_gen.cpp \
                extern/extern.cpp \
                `llvm-config-9 --cxxflags --ldflags --system-libs --libs core mcjit native` \
#./a.out

