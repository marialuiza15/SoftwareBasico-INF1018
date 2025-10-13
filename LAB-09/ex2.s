

.text
.globl fat
fat:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp

    movq %rbx, -8(%rbp)
    movq %r12, -16(%rbp)

    cmp $0, %edi # true: n==0, false: n>0 ou n<0
    jne ELSE
    movl $1, %eax
    jmp FIM

    ELSE:
      movl %edi, %ebx #agr n esta em rbx
      subl $1, %edi #edi=edi-1
    
      call fat
      imull %ebx, %eax #eax=eax*n
   
      jmp FIM

    
    FIM:
      movq  -8(%rbp),%rbx
      movq  -16(%rbp),%r12

      leave
      ret

    .section .note.GNU-stack,"",@progbits

