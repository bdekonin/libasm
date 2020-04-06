global .text
    global _ft_read

_ft_read:
    mov rax, 0x2000003
    syscall
    movsxd rax, eax
    jc error
    ret

error:
    mov rax, -1
    ret