#include <ctype.h>
#include <stdio.h>
#include <math.h>

int string2num (char *s, int divisor) { // s é um ponteiro (8 bytes) que aponta para um espaço de memoria que armazena um char (1 byte)
  int a = 0;
  for (; *s; s++){
     // nao entendi esse for?????
    a = a*10 + (*s - '0');
  }
  int base = 2;
  int resto = 0;
  int quo = 0;
  int dividendo = a;
  int final = 0;

  for (;base<=10;base++){
    resto = dividendo%divisor;
    quo = dividendo/divisor;
    dividendo = quo;

    final = final + (resto * pow(10, (base-2)));
  }

  return final;
}
// eu entendi que é uma função que converte uma string para um inteiro, mas eu nao entendi como isso acontece


int main (void) {
  printf("==> %d\n", string2num("637", 9));

  return 0;
}

// a*10 será sempre 0
// *s - '0'