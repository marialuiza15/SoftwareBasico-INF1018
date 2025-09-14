#include <stdio.h>

void dump (void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%p - %02x\n", p1, *p1);
    p1++;
  }
}

int main (void) {
  signed char sc = -1; // 8 bits
  unsigned int ui = sc; // 32 bits

  dump(&ui, sizeof(ui));

  return 0;
}