#include <iostream>
#include <gc.h>
#include <cstdlib>
extern "C"{
	int run();
}
int main(){
	auto a = run();
	std::cout << "Output from run() " << a << std::endl;
	return 0;
}
