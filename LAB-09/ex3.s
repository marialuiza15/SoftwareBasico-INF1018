
/*
reg     var
r10d     i
r11d     s
r14d    a[i]
*/


.text
.globl foo
foo:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp

    #callee-saved
    movq %r14, -8(%rbp)

    movl $0, %r10d # r10d=0 i=0
    movl $0, %r11d # r11d=0 s=0

    jl LOOP

    LOOP:
        cmp %esi, %r10d # true: i<n false: i>=n
        
        jmp FIM

        leaq (%rdi, %r10, 4), %r13
        movl (%r13), %r14d

        addl %r14d, %r11d # s=s+a[i]

        cmp $0, %r14d # true: a[i]==0 false: a[i]<0 ou a[i]>0
        jne FORA_IF
        movl %r11d, (%r13) # para gravar um valor no vetor, acessamos o conteudo de memoria dele, fazendo ((%r13)), se fizermos referencia direto ao r14, estarfemos apenas modificando a cópia do vetor, e nao o conteudo dele
        mov $0, %r11d

    FORA_IF:
        addl $1, %r10d
        jmp LOOP

    FIM:
        movq  -8(%rbp),%r14
        leave
        ret
    .section .note.GNU-stack,"",@progbits
