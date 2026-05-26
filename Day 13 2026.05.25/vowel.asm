.model small
.stack 100h
.data
	msg1 db "Enter a character: $"
	msg2 db "Total Vowels     : $"
	msg3 db "Total Consonants : $"
	msg4 db "Invalid inputs    : $"
	vowel db 0
	conso db 0
	nonal db 0
	count db 10	
.code
start:	
	mov ax,@data
	mov ds,ax

	mov dx,offset msg1
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	mov bl,al
	
	call newline
	
	cmp bl,65
	jl checklow
	cmp bl,90
	jg checklow
	
	jmp checkvowel
	
	checklow:
		cmp bl,97
		jl notalpha
		cmp bl,122
		jg notalpha
		
		sub bl,32
	
	checkvowel:
		cmp bl,'A'
		je isvowel
		cmp bl,'E'
		je isvowel
		cmp bl,'I'
		je isvowel
		cmp bl,'O'
		je isvowel
		cmp bl,'U'
		je isvowel
		
		inc conso
		jmp next
		
	notalpha:
		inc nonal
		jmp next
		
	isvowel:
		inc vowel
		
	next:
		dec count
		jnz start
		
		mov dx,offset msg2
		mov ah,09h
		int 21h
		
		mov dl,vowel
		add dl,48
		mov ah,02h
		int 21h
		call newline
		
		mov dx,offset msg3
		mov ah,09h
		int 21h
		
		mov dl,conso
		add dl,48
		mov ah,02h
		int 21h
		call newline
		
		mov dx,offset msg4
		mov ah,09h
		int 21h
		
		mov dl,nonal
		add dl,48
		mov ah,02h
		int 21h

	mov ax,4c00h
	int 21h

	proc newline
		mov dl,10
		mov ah,02h
		int 21h
	ret
	endp	
end start