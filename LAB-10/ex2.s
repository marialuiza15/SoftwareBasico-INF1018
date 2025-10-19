.text
.globl add2

add2:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp

    #CALLEE SAVED
    movq %r12, -8(%rbp)
    movq %r13, -16(%rbp)

    testq %rdi, %rdi ## se é NULL
    jne ELSE
    movl $0, %eax #retorna 0
    jmp FIM

    ELSE:
        movq %rdi, %r12 #r12 = x
        movq 8(%rdi), %rdi #pois conteudo original de rdi é um pontiero
        call add2
        movl %eax, %r13d #r13d =temp
        add 0(%r12), %r13d # temp = temp + x->val
        movl %r13d, %eax
        jmp FIM

    FIM:
        movq -16(%rbp), %r13
        movq -8(%rbp), %r12

        leave 
        ret



.section .note.GNU-stack,"",@progbits


