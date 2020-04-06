global .text
    global _ft_write

; 4	AUE_NULL	ALL	{ user_ssize_t write(int fd, user_addr_t cbuf, user_size_t nbyte);
; %rax	System call	%rdi	%rsi	%rdx
_ft_write:
    mov rax, 0x2000004
    syscall
    jc error
    ret

error:
    mov rax, -1
    ret