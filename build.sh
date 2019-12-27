g++ -g -O0 -Wall files/file_handler.cpp \
                parsing/lexer.cpp \
                test_lexer.cpp \
                driver/main_driver.cpp \
                AST/ASTNodes.cpp \
                AST/ASTTree.cpp \
                code_generation/code_gen.cpp \
                `llvm-config --cxxflags --ldflags --system-libs --libs core` \
#./a.out

