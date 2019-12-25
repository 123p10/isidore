CXX = g++
#CXXFLAGS = -Wall -g
FILES = test_lexer.o files/file_handler.o parsing/lexer.o
all:
	rm -f $(FILES) *.o
test_lexer: $(FILES)
