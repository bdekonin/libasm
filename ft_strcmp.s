global .text
    global _ft_strcmp

_ft_strcmp:
		mov rax, 0 				; rdi(s1), rsi(s2)

loop:
		cmp BYTE[rdi + rax], 0 ; !s1
		je	done
		cmp BYTE[rsi + rax], 0 ; !s2
		je	done
		mov dl, BYTE[rdi + rax] ; char = s1[i]
		cmp dl, BYTE[rsi, rax] ; char == s2[i]
		jne done
		inc rax ; i++
		jmp loop

; movsx can be used to sign extension something,
; dl belongs to the 8 bit registers, but since we want to copy that to the 64 bit register,
; we use movsx for doing this

done:
		mov dl, BYTE[rdi + rax] ; dl = s1[i]
		sub dl, BYTE[rsi + rax] ; sl - s2[i]
		movsx rax, dl
		ret