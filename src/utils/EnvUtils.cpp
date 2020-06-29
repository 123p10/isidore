#include "EnvUtils.h"
std::string getEnv(const std::string & var){
	const char * val = std::getenv(var.c_str());
	return val ? val : "";
}
