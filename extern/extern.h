#ifndef EXTERN_H
#define EXTERN_H
#include <cctype>
#include <iostream>


#ifdef _WIN32
#define DLLEXPORT __declspec(dllexport)
#else
#define DLLEXPORT
#endif



extern "C" DLLEXPORT double putchard(double X);
extern "C" DLLEXPORT double printd(double X);

#endif
