; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strdup.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: bdekonin <bdekonin@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/11/06 12:04:08 by bdekonin      #+#    #+#                  ;
;    Updated: 2020/11/09 19:23:38 by bdekonin      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_strdup
	extern _ft_strcpy
	extern _ft_strlen
	extern _malloc

_ft_strdup:
	cmp rdi, 0
	je error ; check if NULL

	push rdi ; saves rdi for later use
	call _ft_strlen 
	mov rdi, rax ; moves the first parameter value to the return value of strlen 							
	call _malloc ; malloces the size of rdi which is the first argument
	cmp rax, 0
	je error
	mov rdi, rax
	pop rsi
	call _ft_strcpy ; dst = rdi, src = rsi
	ret

error:
	mov rax, 0
	ret
