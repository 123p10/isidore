CXX = g++
LLVMFLAGS = `llvm-config-9 --cxxflags --ldflags --system-libs --libs core mcjit native`
INC = -I/usr/lib/llvm-9/include
CXXFLAGS = -Wall -g -O0 -rdynamic $(LLVMFLAGS)
OBJFILES = main.o AST/ASTNodes.o AST/ASTTree.o code_generation/code_gen.o driver/main_driver.o extern/extern.o files/file_handler.o parsing/lexer.o types/type_manager.o
HFILES = AST/ASTNodes.h
main: $(OBJFILES)
	$(CXX) $(CXXFLAGS) -o main $(OBJFILES) $(HFILES) $(LLVMFLAGS)
clean:
	-rm *.o $(OBJFILES) main