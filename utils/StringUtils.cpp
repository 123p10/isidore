#include "StringUtils.h"
#include <vector>
#include <sstream>
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
	std::string out, tmp;
	std::vector<std::string> stack;
	std::stringstream ss(path);
	while(getline(ss,tmp,'/')){
		if(tmp == "" || tmp == "."){
			continue;
		}
		if(tmp == ".." && !stack.empty()){
			stack.pop_back();
		}
		else if(tmp != ".."){
			stack.push_back(tmp);
		}
	}
	out = ".";
	for(int i = 0;i < (int)stack.size();i++){
		out += "/" + stack.at(i);
	}
	if(out.empty()){
		return "./";
	}
	return out;
}
