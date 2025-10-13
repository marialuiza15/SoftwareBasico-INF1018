#include <stdio.h>

int fat(int n) ;
int main(void) {
    int n;

    printf("Digite um número inteiro: ");
    scanf("%d", &n);

    printf("Fatorial de %d = %d\n", n, fat(n));

    return 0;
}

//gcc -Wall -no-pie -o ex2 ex2.s main2.c