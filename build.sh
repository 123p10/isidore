g++ -g -O3 -rdynamic -Wall files/file_handler.cpp \
                parsing/lexer.cpp \
                test_lexer.cpp \
                driver/main_driver.cpp \
                AST/ASTNodes.cpp \
                AST/ASTTree.cpp \
                code_generation/code_gen.cpp \
                `llvm-config-9 --cxxflags --ldflags --system-libs --libs core mcjit native` \
#./a.out

