#include "StringUtils.h"
std::string ParseOutFileName(std::string input){
	int lastSlash = input.find_last_of("/");
	if(lastSlash < 0 || lastSlash >= (int)input.length() - 1){
		lastSlash = 0;
	}
	input = input.substr(0,lastSlash);
	if(lastSlash != 0){
		input += "/";
	}
	return input;
}
std::string ParseOutExtension(std::string input){
	int lastDot = input.find_last_of(".");
	input = input.substr(0,lastDot);
	return input;
}

std::string SimplifyPath(std::string path){
	return path;
}
