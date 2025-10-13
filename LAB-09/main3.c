#include <stdio.h>

void foo(int a[], int n);
    
int main(void) {
    int a[] = {1, 2, 3, 0, 4, 5, 0, 6};
    int n = sizeof(a) / sizeof(a[0]);

    printf("Vetor original:\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", a[i]);
    }
    printf("\n");

    foo(a, n);

    printf("Vetor após foo:\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", a[i]);
    }
    printf("\n");

    return 0;
}

//gcc -Wall -no-pie -o ex3 ex3.s main3.c