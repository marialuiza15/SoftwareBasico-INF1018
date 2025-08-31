#include <stdio.h>

int odd_ones(unsigned int x) {
    // em c, 0 é true e 1 é false
    if(x&1){
        return 0;
    }
    else{
        return 1;
    }
}
int main() {
  printf("%x tem numero %s de bits\n",0x01010101,odd_ones(0x01010101) ? "impar":"par");
  printf("%x tem numero %s de bits\n",0x01030101,odd_ones(0x01030101) ? "impar":"par");
  return 0;
}