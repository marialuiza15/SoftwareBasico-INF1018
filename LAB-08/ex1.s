  .data
  s1: .string "ls -ls"

  .text
  .globl main
  main:
  /* prologo */
    pushq %rbp
    movq  %rsp, %rbp

  /* coloque seu codigo aqui */
    leaq    s1(%rip), %rdi    # rdi = 1º argumento, que agora recebe o endereço da string
    call    system            

    movl    $0, %eax          # retorna 0

  /* finalizacao */
    leave
    ret