section .text
	global _ft_strlen

_ft_strlen:
	mov rax, 0
	jmp while

while:
	cmp BYTE [rdi + rax], 0
	je done ; jump equal
	inc rax ; rax + 1
	jmp while 

done:
	ret
