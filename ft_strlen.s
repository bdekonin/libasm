section .text
    global _ft_strlen

_ft_strlen:
    mov rax, 0 ; i = 0
    jmp loops

increment:
    inc rax ; i++

loops:
    cmp BYTE[rdi + rax], 0 ; str[i] == 0
    jne increment ; 

done:
    ret