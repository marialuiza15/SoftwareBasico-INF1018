#include <stdio.h>
#include <stdlib.h>

float foo (float pf) {
  return pf+1;
}

int main (int argc, char **argv) {
  float f;
  if (argc!=2) {
    printf ("uso do programa: %s <valor float>\n", argv[0]);
    exit(0);
  }
  f = atof(argv[1]);
  printf ("foo(%.2f): %.2f\n", f, foo(f));
  return 0;
}

// gcc -Wall -o ex1 ex1.c
// compila exibindo os warnings. Vai gerar o arquivo de saida ex1 (-o ex1) usando como arquivo de entrada ex1.c
// assim a gente compila o código, e fica pronto para a execução. Pra executar basta chamar o arquivo e passar algum parametro.

// ls -l
// -rwxrwxrwx 1 codespace codespace 16072 Aug 19 13:36 ex1 -> o x nas permissoes do arquivo indica que ele é executavel.
// -rw-rw-rw- 1 codespace codespace   571 Aug 19 13:39 ex1.c -> a ausencia do x nas permissoes indica que nessa etapa ele ainda nao era executavel.