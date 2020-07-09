global .text
    global _ft_read

extern ___error

_ft_read:
    mov rax, 0x2000003
    syscall
    jc error
    ret

error:
	push rbp
	mov rdx, rax
	call ___error
	pop rbp
	mov [rax], rdx
	mov rax, -1
	ret