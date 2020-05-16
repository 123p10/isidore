CXX = g++
<<<<<<< HEAD
LLVMFLAGS = `llvm-config --cxxflags --ldflags --system-libs --libs all`
INC = -I/usr/local/include/llvm
CXXFLAGS = -Wall -g -O0 -rdynamic -lgc $(LLVMFLAGS)
=======
LLVMFLAGS = `llvm-config --cxxflags --ldflags --system-libs --libs core mcjit orcjit native`
INC = -I/usr/local/include/llvm
CXXFLAGS = -Wall -g -O0 -rdynamic $(LLVMFLAGS)
>>>>>>> e61b8c863af3976a63f4bf3a485b03cb534eb498
OBJFILES = main.o AST/ASTNodes.o AST/ASTTree.o code_generation/code_gen.o \
		   driver/main_driver.o extern/extern.o files/file_handler.o parsing/lexer.o \
		   types/type_manager.o types/primitives/int64.o types/primitives/integer.o \
		   types/primitives/type.o types/primitives/short.o types/primitives/floating_point.o \
<<<<<<< HEAD
		   types/primitives/double.o runtime/runtime.o
HFILES = AST/ASTNodes.h
main: $(OBJFILES)
	$(CXX) $(CXXFLAGS) -o compile $(OBJFILES) $(HFILES) $(LLVMFLAGS)
clean:
	-rm *.o $(OBJFILES) compile
=======
		   types/primitives/double.o
HFILES = AST/ASTNodes.h
main: $(OBJFILES)
	$(CXX) $(CXXFLAGS) -o main $(OBJFILES) $(HFILES) $(LLVMFLAGS)
clean:
	-rm *.o $(OBJFILES) main
>>>>>>> e61b8c863af3976a63f4bf3a485b03cb534eb498
