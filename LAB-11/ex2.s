.data
sf: .string "%d\n"

.text
.globl bemboba

bemboba:
    pushq %rbp
    movq %rsp, %rbp
    subq $48, %rsp #4 ints + ponteiro + i

    movl %edi, -4(%rbp) # num
    leaq -24(%rbp), %rax # endereço de local
    movq %rax, -32(%rbp) # a = local
    movl $0, -36(%rbp) # i = 0

.LOOP:
    cmpl $4, -36(%rbp)
    jge  .FORA_LOOP  # se i >= 4, sai do loop

    movq -32(%rbp), %rax    
    movl -4(%rbp), %edx     
    movl %edx, (%rax)       

    addq $4, %rax            
    movq %rax, -32(%rbp)

    addl $1, -36(%rbp)       
    jmp  .LOOP

.FORA_LOOP:
    leaq -24(%rbp), %rdi     
    movl $4, %esi           
    call addl  
    leave
    ret
    
.section .note.GNU-stack,"",@progbits
