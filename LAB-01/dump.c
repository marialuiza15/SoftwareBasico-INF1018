#include <stdio.h>

void dump (void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%d ", *p1); 
    p1++;
  }
}

// *p é um ponteiro que contem em seu conteudo um endereço de memória
// n é quantos bytes 

// unsigned char tem 1 byte de tamanho

// 1 ponteiro tem 8 bytes de tamanho (em maquinas 64 bits)

// p1 aponta para o mesmo endereço de p

// em n-- iteramos na quantidade de bytes

// em p1++ andamos para próximo byte d ememoria 