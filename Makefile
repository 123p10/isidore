CXX = g++
LLVMFLAGS = `llvm-config-9 --cxxflags --ldflags --system-libs --libs core mcjit native`
INC = -I/usr/lib/llvm-9/include
CXXFLAGS = -Wall -g -O0 -rdynamic $(LLVMFLAGS)

main: test_lexer.o AST/ASTNodes.o AST/ASTNodes.h AST/ASTTree.o code_generation/code_gen.o driver/main_driver.o extern/extern.o files/file_handler.o parsing/lexer.o
	$(CXX) $(CXXFLAGS) -o main test_lexer.o AST/ASTNodes.o AST/ASTTree.o code_generation/code_gen.o driver/main_driver.o extern/extern.o files/file_handler.o parsing/lexer.o $(LLVMFLAGS)
