OBJFILES = command_util.o ../../src/utils/StringUtils.o ../../src/utils/EnvUtils.o
CXX = g++
CXXFLAGS = -std=c++17 -O0 -lgc -g
main: $(OBJFILES)
	$(CXX) $(CXXFLAGS) -o exec/isidore $(OBJFILES)
clean: 
	-rm $(OBJFILES) *.o exec/isidore

