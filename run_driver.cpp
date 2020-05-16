#include <iostream>
#include <gc.h>
extern "C"{
	double run();
}
int main(){
	auto a = run();
	std::cout << "Output from run() " << a << std::endl;
	return 0;
}
