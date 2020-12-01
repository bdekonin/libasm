; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_read.s                                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: bdekonin <bdekonin@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/11/06 12:04:01 by bdekonin      #+#    #+#                  ;
;    Updated: 2020/11/06 12:49:11 by bdekonin      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; https://stackoverflow.com/questions/1299077/moving-between-two-memory-addresses
; https://stackoverflow.com/questions/15304829/how-to-return-errno-in-assembly

global .text
	global _ft_read
	extern ___error

_ft_read:
	mov rax, 0x2000003
	syscall
	jc error ; carry flag is enabled
	ret ; no error

error:
	push rbp ; stack alignment
	mov rdx, rax ; saving the error code in rdx
	call ___error ; returns errno pointer to rax
	pop rbp  ; stack alignment
	mov [rax], rdx ; rax now points to a adress. so we dereference it by doing [rax]
	mov rax, -1
	ret