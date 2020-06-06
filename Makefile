CXX = g++
LIBS = native core all-targets orcjit
LLVMFLAGS = `llvm-config --cxxflags --ldflags --system-libs --libs $(LIBS)`

INC = -I/usr/local/include/llvm
CXXFLAGS = -Wall -Wextra -O0 -g -rdynamic -lgc $(LLVMFLAGS)
OBJFILES = main.o AST/ASTNodes.o AST/ASTTree.o code_generation/code_gen.o \
		   driver/main_driver.o extern/extern.o files/file_handler.o parsing/lexer.o \
		   types/type_manager.o types/primitives/int64.o types/primitives/integer.o \
		   types/primitives/type.o types/primitives/short.o types/primitives/floating_point.o \
		   types/primitives/double.o runtime/runtime.o utils/StringUtils.o
HFILES = AST/ASTNodes.h
BUILD = $(CXX) $(CXXFLAGS) -o compile $(OBJFILES) $(HFILES) $(LLVMFLAGS)
main: $(OBJFILES)
	$(BUILD) -O0
clean:
	-rm *.o $(OBJFILES) compile
prod: $(OBJFILES)
	$(BUILD) -O2
