section .text
    global _ft_strdup

extern _ft_strcpy
extern _ft_strlen
extern _malloc

; Parameters registers
; RDI RSI RDX RCX R8 R9



_ft_strdup:
	cmp rdi, 0
	je error ; check if NULL

	push rdi ; saves the starting adress
	call _ft_strlen 
	mov rdi, rax ; moves the first parameter value to the return value of strlen 							
	call _malloc ; malloces the size of rdi which is the first argument
	cmp rax, 0
	je error
	mov rdi, rax
	pop rsi ; stores the pushed adress and puts it in rsi
	call _ft_strcpy ; dst = rdi, src = rsi
	ret

error:
	xor rax, rax			
	ret
