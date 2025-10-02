/*
void foo (int a[], int n) {
  int i;
  int s = 0;
  for (i=0; i<n; i++) {
    s += a[i]; // para calcular a[i] em asembly, faremos: end de a[i] = end inicial de a + i * sizeof(tipo do dado de a)
    if (a[i] == 0) {
      a[i] = s;
      s = 0;
    }
  }
}
*/

// nao tem .data pq nao tem variaveis globais


/*
Dicionario
Reg Var
rdi  a 
esi  n
r10d s
r11d i
rd14d temp(i')
*/



.text
.globl foo // declara a função foo
foo:
    // quando o códico c encontra uma função, 
    // ele reserva espaços de memoria para as 
    // variaveis locais dessa função e para o 
    // valor que foi dito que será retornado, 
    // esse registro é o rdp. No final é preciso 
    // limpar esse registro para voltar a memoria 
    // para onde estava antes

    // Criar o RA (Registro de Ativação)
    pushq %rbp // salva a base do RA da chamadora
    movq %rsp, %rdp // frame pointer # aprontar para a base do RA  da chamada 
*    subq $16 %rsp //abrir espaço para RA da chamada

    # salvar os registradores callee-saved que vao ser usados
    movq %r14, -8(%rbp) // como usamos o r14, e r14 é pra 8 bytes, colocamos o r14 no rdp -8 pra salvar o lugar que o r14 estava antes de ser mechido

    int s=0 -> movl $0, %rd10d

    -----
    for (i=0; i<n; i++) 
    i=0
    while(i<n){
        i++
    }
    -----

    movl $0, %r11d

    WHILE:
        cmpl %esi, %r11d // comparando i com n
        jge FORA_WHILE


        // etapa importante demais
        -----
        s+=a[i] -> s = s + [1] // temp = a[i]; s +=temp
        -----
        movl %r11d, %r14d // i->i'
        imull $4, %r14d // sizeof T*1
        addq %rdi, %r14  // &a[i] agr esta em r14

        addl (%r14), %r10d

        -----
        if (a[i]==0)
        -----
        cmpl $0, (%r14)
        jne FORA_IF

        -----
        a[i]=s
        -----
        movl %r10, (%r14) // como r14 é um ponteiro, para acessar oc otneudo de a[i], acessamos o conteudo da memoria apontado pro r14, com parentese
        movl $0, r10d 

    FORA_IF:
        incl %r11d // i++

    FORA_WHILE:
        // sem valor de retorno . retorna nada pq a função é void

    // aagr tem que restaurar os registradores called-saved salvos
        movq -8(%rdp), %r14
    
    // destruir o RA da função chamada 
        leave

        ret // obriagtorio para retornar


        

