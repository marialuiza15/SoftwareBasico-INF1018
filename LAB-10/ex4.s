.text
.globl map2

map2:
    pushq %rbp
    movq  %rsp, %rbp
    subq  $32, %rsp      
    movl  $0, -4(%rbp)

LOOP:
    movl  -4(%rbp), %eax     
    cmpl  %edx, %eax         
    jge   FIM                

    movl  -4(%rbp), %eax     
    cltq                     
    
    movl  (%rdi,%rax,4), %edi   
    call  f                     
    movl  %eax, (%rsi,%rax,4)   

    addl  $1, -4(%rbp)
    jmp   LOOP

FIM:
    leave
    ret

.section .note.GNU-stack,"",@progbits
