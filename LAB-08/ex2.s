
/*
reg     var
%edi    x
%esi    lim
*/

.text
.globl filtro
filtro:
    cmp %esi, %edi # x<lim   x>=lim
    jge ELSE
    movl $0, %eax
    jmp FIM

ELSE:
    movl %edi, %eax

FIM:
    ret



/*
reg       var
r12d      i
rbx       p - ocupa 8 bytes
rax       p* - ocupa os bytes do tipo
*/


.data
nums: .int 3,-5,7,8,-2
sf: .string "%d\n" 

.text
.globl main

main:

  # PROLOGO
  pushq %rbp
  movq %rsp, %rbp
  subq $16 , %rsp #VOLTAR NO FIM

  # SALVAR CALLEE-SAVED
  movq %rbx, -8(%rbp)
  movq %r12, -16(%rbp)
  movq %r13, -24(%rbp)

  # CÓDIGO
  movl $0, %r12d

  # PARA PEGAR int *p = nums

  leaq    nums(%rip), %rbx # (endereço) p = rbx
  movq    (%rbx), %r13 # (conteudo) *p = r13

  LOOP:
    # COMPARAR PARA IR PRO while
    cmp $5, %r12d # true: i<5  false: i>=5
    jge FORA_LOOP
    movq (%rbx), %rdi #1°arg (conteudo) *p = rdi  
    movl $1, %esi #2°arg

    call filtro

    # PRINTAR
    movq $sf, %rdi #1º arg
    movl %eax, %esi #eax pq queremos imprimir op valor retornado pela função filtro, que ficou no registrador de retorno eax
    movl $0, %eax
    call printf

    addl $1, %r12d # i++
    addq $4, %rbx  # p++


    jmp LOOP
  
  FORA_LOOP:
    movq -8(%rbp), %rbx
    movq -16(%rbp), %r12
    movq -24(%rbp), %r13

    leave
    ret


.section .note.GNU-stack,"",@progbits





