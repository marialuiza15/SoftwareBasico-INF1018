
.text
.globl add

add:
    pushq %rbp
    movq %rsp, %rbp
    
    addl %edi, %esi # b = a+b
    addl %esi, %edx # c = b+c
    movl %edx, %eax

    leave
    ret

    .section .note.GNU-stack,"",@progbits
