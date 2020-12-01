; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strlen.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: bdekonin <bdekonin@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/11/06 12:04:12 by bdekonin      #+#    #+#                  ;
;    Updated: 2020/11/06 12:04:13 by bdekonin      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

section .text
	global _ft_strlen

_ft_strlen:
	mov rax, 0 ; i = 0
	jmp while

while:
	cmp BYTE [rdi + rax], 0 ; if (rdi[i] == 0)
	je done ; jump equal
	inc rax ; rax++
	jmp while ; recall itself

done:
	ret ; return (rax)
