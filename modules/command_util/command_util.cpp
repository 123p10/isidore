#include <iostream>
#include <cstdlib>
#include <sstream>
#include <vector>
#include <filesystem>
#include <cstring>
#include <iostream>
#include <fstream>
#include "../../src/utils/StringUtils.h"
std::string getEnv(const std::string & var){
	const char * val = std::getenv(var.c_str());
	if(!val){
		return "";
	}
	return val;
}

std::string buildFiles(std::string ISIDORE_PATH,std::string input, std::string depsLocation){
	input += " " + ISIDORE_PATH + "src/extern/extern.o";
	input += " " + ISIDORE_PATH + "modules/runner/runner.cpp";

	std::string file = "";
	std::ifstream depsFile(depsLocation);
	while(depsFile >> file){
		input += " " + ParseOutExtension(file) + ".o";
	}
	return input;
}


int main(int argc, char* argv[]){
	bool create_exec = true;
	//Read in Arguments
	if(argc == 1){
		std::cout << "Run `isidore file.isd` or `isidore compile file.isd` to do something" << std::endl;
		return 0;
	}
	
	int i = 1;
	if(argc == 2 && strcmp(argv[1],"build") == 0){
		std::cout << "Add a filename to build";
		return 0;
	}
	else{
		if(strcmp(argv[1],"build") == 0){
			i++;
			create_exec = false;
		}
	}
	std::string fileName;

	for(; i < argc;i++){	
		fileName = argv[i];
	}

	std::string files = ParseOutExtension(fileName) + ".o";

	std::string ISIDORE_PATH = getEnv("ISIDORE_PATH");
	//Run commands
	std::string run_isidore = ISIDORE_PATH + "modules/compiler/compile -r -f " +  std::filesystem::current_path().u8string() + "/" + fileName;
	system(run_isidore.c_str());
	if(create_exec){
		files = buildFiles(ISIDORE_PATH,files, ParseOutExtension(fileName) + ".deps");
		std::string command = "g++ -O0 -g -o " + ParseOutExtension(fileName) + " " + files +" -lgc";
		system((command ).c_str());
		std::cout << "Wrote exec to " + ParseOutExtension(fileName) + "\n";
	}
	return 0;
}
