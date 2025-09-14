#include <stdio.h>

void dump (void *p, int n) {
  unsigned char *p1 = p; // char sem sinal, 1 byte - mas um ponteiro tem 8 bytes para guardar o conteudo de endereço de memoria, e local para onde o pionteiro aponta, pode guardar apenar 1 byte char.
  while (n--) { // numero de bytes
    printf("%p - %02x\n", p1, *p1); // p1 sem asteristico printa o endereço do ponteiro. *p1 printa o conteudo dentro do endereço de memoria que o ponteiro aponta.
    p1++;
  }
}

int main (void) {
  int i,j;
  short a[2][3];
  int b[2];

  for (i=0;i<2;i++) {
    b[i] = i;
    for (j=0;j<3;j++)
      a[i][j] = 3*i+j;
  }

  printf ("b: \n");
  dump (b, sizeof(b));
  printf ("a: \n");
  dump (a, sizeof(a));

  return 0;
}