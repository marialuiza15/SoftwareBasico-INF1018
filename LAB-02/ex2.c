#include <ctype.h>
#include <stdio.h>

int string2num (char *s) { // s é um ponteiro (8 bytes) que aponta para um espaço de memoria que armazena um char (1 byte)
  int a = 0;
  for (; *s; s++) // nao entendi esse for?????
    a = a*10 + (*s - '0');
  return a;
}
// eu entendi que é uma função que converte uma string para um inteiro, mas eu nao entendi como isso acontece

int main (void) {
  printf("==> %d\n", string2num("1234"));
  printf("==> %d\n", string2num("1234") + 1);
  printf("==> %d\n", string2num("1234") + string2num("1"));
  return 0;
},

// a*10 será sempre 0
// *s - '0'