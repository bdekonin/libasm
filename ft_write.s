global .text
	global _ft_write

extern ___error

_ft_write:
	mov rax, 0x2000004
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
