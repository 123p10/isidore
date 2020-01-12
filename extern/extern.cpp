#include "extern.h"


extern "C" DLLEXPORT double putchard(double X) {
  fputc((char)X, stderr);
  return 0;
}
extern "C" DLLEXPORT double printd(double X) {
  fprintf(stderr, "%f\n", X);
  return 0;
}
extern "C" DLLEXPORT short putcharc(short X){
  fputc((char)X, stderr);
  return 0;
}
extern "C" DLLEXPORT short getcharc(){
  char c = std::getchar();
  return (short)c;
}
