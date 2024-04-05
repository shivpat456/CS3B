#include <stdio.h>

void fact(int n) { 
  printf("Stack call %d\n", n);
  ++n;
  fact(n);
}

int main() {
  fact(0);
  return 0;
}