CXX = g++
LIBS = native core all-targets orcjit
LLVMFLAGS = `llvm-config --cxxflags --ldflags --system-libs --libs $(LIBS)`

INC = -I/usr/local/include/llvm
CXXFLAGS = -Wall -g -O0 -rdynamic -lgc $(LLVMFLAGS)
OBJFILES = main.o AST/ASTNodes.o AST/ASTTree.o code_generation/code_gen.o \
		   driver/main_driver.o extern/extern.o files/file_handler.o parsing/lexer.o \
		   types/type_manager.o types/primitives/int64.o types/primitives/integer.o \
		   types/primitives/type.o types/primitives/short.o types/primitives/floating_point.o \
		   types/primitives/double.o runtime/runtime.o
HFILES = AST/ASTNodes.h
main: $(OBJFILES)
	$(CXX) $(CXXFLAGS) -o compile $(OBJFILES) $(HFILES) $(LLVMFLAGS)
clean:
	-rm *.o $(OBJFILES) compile
