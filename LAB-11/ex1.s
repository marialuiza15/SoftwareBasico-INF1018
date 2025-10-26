


.data
sf:  .string "numero: "
d:   .string "%d"

.text
.globl novonum

novonum:
 pushq %rbp
 movq %rsp, %rbp
 subq $16, %rsp

 leaq sf(%rip), %rdi  #origen ->destino
 movl $0, %eax
 call printf

 # scanf("%d", &minhalocal);
 leaq -4(%rbp), %rsi    
 leaq d(%rip), %rdi  
 movl $0, %eax
 call scanf

 movl -4(%rbp), %eax  

 leave
 ret

.section .note.GNU-stack,"",@progbits
