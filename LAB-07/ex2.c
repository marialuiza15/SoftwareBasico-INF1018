#include <stdio.h>

char S2[] = {65, 108, 111, 32, 123, 103, 97, 108, 101, 114, 97, 125, 33, 0, '}'};

int main(void) {
    char *pc = S2;
    while (*pc) {
        if (*pc != 123 && *pc != 125) {  // Verifica se o caractere não é { nem }
            printf("%c", *pc);
        }
        pc++;  // Avança para o próximo caractere
    }
    printf("\n");
    return 0;
}
