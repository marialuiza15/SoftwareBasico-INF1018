#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

typedef unsigned packed_t;

int string2num (char *s, int base) {
  int a = 0;
  for (; *s; s++) {
    if(isdigit(*s))
      a = a*base + (*s - '0');
    else if((*s >= 'A') && (*s < (base-10+'A')))
      a = a*base + ((*s - 'A') + 10);
    else if((*s >= 'a') && (*s < (base-10+'a')))
      a = a*base + ((*s - 'a') + 10);
    else {
      printf("pane: numero invalido! \n");
      exit(1);
    }
  }
  return a;
}


/* extrai byte indicado e retorna valor inteiro correspondente (32 bits) com sinal */
int xbyte (packed_t word, int bytenum){ // word é o inteiro de 32 bits empacotadso
    int bytex, contshift = 0;

    for (int i = 0; i < 4; i++){
        bytex = (word >> contshift) & 0x000000FF;
        contshift = contshift +8;
        if(i==bytenum){
            return bytex;
        }
    }
    return 0;
}



int main (int argc, char **argv) {
  int x;
  if (argc != 3) {
    printf ("uso: %s <word (em hexadecimal)> <bytenum>\n", argv[0]);
    exit(1);
  }

  x = xbyte(string2num(argv[1], 16), atoi(argv[2]));
  printf ("%08x  %d\n", x, x);
  return 0;
}


// int main (void) {
    
//     packed_t word = 0xAABBCCDD;
//     printf("word = 0x%X\n", word);
//     printf("Byte 0: %x\n",xbyte(word, 0));
//     printf("Byte 1: %x\n",xbyte(word, 1));
//     printf("Byte 2: %x\n",xbyte(word, 2));
//     printf("Byte 3: %x\n",xbyte(word, 3));
//     return 0;

// }