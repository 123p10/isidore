CXX = g++
LLVMFLAGS = `llvm-config --cxxflags --ldflags --system-libs --libs core mcjit native`
INC = -I/usr/local/include/llvm
CXXFLAGS = -Wall -g -O0 -rdynamic $(LLVMFLAGS)
OBJFILES = main.o AST/ASTNodes.o AST/ASTTree.o code_generation/code_gen.o \
		   driver/main_driver.o extern/extern.o files/file_handler.o parsing/lexer.o \
		   types/type_manager.o types/primitives/int64.o types/primitives/integer.o \
		   types/primitives/type.o types/primitives/short.o types/primitives/floating_point.o \
		   types/primitives/double.o
HFILES = AST/ASTNodes.h
main: $(OBJFILES)
	$(CXX) $(CXXFLAGS) -o main $(OBJFILES) $(HFILES) $(LLVMFLAGS)
clean:
	-rm *.o $(OBJFILES) main
