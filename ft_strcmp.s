; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcmp.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: bdekonin <bdekonin@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/04/22 15:43:08 by bdekonin      #+#    #+#                  ;
;    Updated: 2020/11/09 19:01:17 by bdekonin      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global .text
	global _ft_strcmp

_ft_strcmp:
	mov rax, 0
	mov rcx, 0
	jmp while

while:
	mov		al, byte [rdi]
	mov		cl, byte [rsi]
	cmp		al, 0
	je		done;
	cmp		al, cl
	jne		done
	inc		rdi
	inc		rsi
	jmp		while

done:
	movzx   rax, al
	movzx   rcx, cx
	sub     rax, rcx
	ret
