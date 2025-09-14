#include <stdio.h>

void dump (void *p, int n) {
  unsigned char *p1 = p; // char sem sinal, 1 byte - mas um ponteiro tem 8 bytes para guardar o conteudo de endereço de memoria, e local para onde o pionteiro aponta, pode guardar apenar 1 byte char.
  while (n--) { // numero de bytes
    printf("%p - %02x\n", p1, *p1); // p1 sem asteristico printa o endereço do ponteiro. *p1 printa o conteudo dentro do endereço de memoria que o ponteiro aponta.
    p1++;
  }
}

int main (void) {

    struct X {
    int a;
    short b;
    int c;
    } x = {0xa1a2a3a4, 0xb1b2, 0xc1c2c3c4};


    dump (&x, sizeof(x));
    return 0;
}