.data 
SF: .string "%d\n"

globl .main

main:
    inc %eax

    movq $SF, %rdi
    movl %eax, %esi

    call printf