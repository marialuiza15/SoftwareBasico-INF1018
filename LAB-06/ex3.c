
#include <stdio.h>

int par_or_impar(unsigned int x) {
    if((x&1) == 1){
        return 1;
    }
    return 0;
}

int main() {
    int nums[] = {10, -21, -30, 45};
    int i, *p;
    for (i = 0, p = nums; i != 4; i++, p++){
        if (par_or_impar(*p)==0){
            printf("%d\n", *p);
        }
    }
  return 0;
}