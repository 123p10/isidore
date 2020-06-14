CXX = g++
LIBS = native core all-targets orcjit
LLVMFLAGS = `llvm-config --cxxflags --ldflags --system-libs --libs $(LIBS)`

INC = -I/usr/local/include/llvm

SRC_LOCATION = ../../src/

CXXFLAGS = -Wall -Wextra -O0 -g -rdynamic -lgc $(LLVMFLAGS)
OBJFILES = compiler.o $(SRC_LOCATION)AST/ASTNodes.o $(SRC_LOCATION)AST/ASTTree.o $(SRC_LOCATION)code_generation/code_gen.o \
		   $(SRC_LOCATION)driver/main_driver.o $(SRC_LOCATION)extern/extern.o $(SRC_LOCATION)files/file_handler.o $(SRC_LOCATION)parsing/lexer.o \
		   $(SRC_LOCATION)types/type_manager.o $(SRC_LOCATION)types/primitives/int64.o $(SRC_LOCATION)types/primitives/integer.o \
		   $(SRC_LOCATION)types/primitives/type.o $(SRC_LOCATION)types/primitives/short.o $(SRC_LOCATION)types/primitives/floating_point.o \
		   $(SRC_LOCATION)types/primitives/double.o $(SRC_LOCATION)runtime/runtime.o $(SRC_LOCATION)utils/StringUtils.o
HFILES = $(SRC_LOCATION)AST/ASTNodes.h
BUILD = $(CXX) $(CXXFLAGS) -o compile $(OBJFILES) $(HFILES) $(LLVMFLAGS)
main: $(OBJFILES)
	$(BUILD) -O0
clean:
	-rm *.o $(OBJFILES) compile
prod: $(OBJFILES)
	$(BUILD) -O2
