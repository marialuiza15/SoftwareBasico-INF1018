/*
Reg         var
r12d        a
*/

.text
.globl add

add:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp

    #SALVAR CALLEE SAVED
    movq %r12, -8(%rbp)

    movl $0, %r12d # a=0
    jmp LOOP

    LOOP:
        testq %rdi, %rdi      #true: x!=0, false: x=0
        je FORA_LOOP

        addl 0(%rdi), %r12d     # r12d = r12d + rdi offset 0 (primeiro item da struct)
        movq 8(%rdi), %rdi      # o *next é um endereço para o proximo nó da struct, entao pra acessa-lo, andamos 8 bytes e usamos q na extensao .
        jmp LOOP

    FORA_LOOP:
        movq -8(%rbp), %r12
        leave
        ret

.section .note.GNU-stack,"",@progbits


