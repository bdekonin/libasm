; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcpy.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: bdekonin <bdekonin@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/11/06 12:04:05 by bdekonin      #+#    #+#                  ;
;    Updated: 2020/11/06 12:04:06 by bdekonin      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global .text
	global _ft_strcpy

; Parameters
; 1 = rdi, 2 = rsi

_ft_strcpy:				; dst = rdi, src = rsi
	mov		rcx, 0		; i = 0
	mov		rdx, 0		; tmp =
	cmp		rsi, 0		; !rsi
	jz		return
	jmp		copy

increment:
	inc		rcx

copy:
	mov		dl, BYTE [rsi + rcx]
	mov		BYTE [rdi + rcx], dl
	cmp		dl, 0
	jnz		increment

return:
	mov		rax, rdi		; return dst
	ret
