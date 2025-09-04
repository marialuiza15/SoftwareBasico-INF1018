#include <stdio.h>

unsigned char switch_byte(unsigned char x){
    unsigned char ladoB= x & 0xF;
    unsigned char ladoA = x & 0xF0;
    
    ladoB = ladoB << 4;
    ladoA = ladoA >> 4;

    return ladoB | ladoA;
}

unsigned char rotate_left(unsigned char x, int n){
    unsigned char a, b;
    a = x>>(8-n);
    b = x<<n;
    return b|a;
}

int main() {
    char x = 0xAB;
    char y = 0x61;
    printf("%x",switch_byte(x));
    printf("%x",rotate_left(y, 1));
    return 0;
}