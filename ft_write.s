; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_write.s                                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: bdekonin <bdekonin@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/11/06 12:04:19 by bdekonin      #+#    #+#                  ;
;    Updated: 2020/11/06 12:51:00 by bdekonin      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

global .text
	global _ft_write
	extern ___error

_ft_write:
	mov rax, 0x2000004
	syscall
	jc error ; carry flag is enabled
	ret ; no error

error:
	push rcx
	mov rdx, rax ; saving the error code in rdx
	call ___error ; returns errno pointer to rax
	pop rcx
	mov [rax], rdx ; rax now points to a adress. so we dereference it by doing [rax]
	mov rax, -1
	ret