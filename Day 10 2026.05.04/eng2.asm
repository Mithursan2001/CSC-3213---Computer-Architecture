.model small
.stack 100h
.data
	n1 db 65
	n2 db 97
	s1 db "    $"
	lower db 0
	input1 db ?
	msg1 db "Uppercase Alphabet: $"
	msg2 db "Lowercase Alphabet: $"
	msg3 db "Enter a Character: $"
	msg4 db "This is an Uppercase !!! $"
	msg5 db "This is a Lowercase !!! $"
	msg6 db "Wrong input!!! $"
	msg7 db "The Lowercase Letter of your input is: $"
	msg8 db "The Uppercase Letter of your input is: $"
.code
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg1
	mov ah,09h
	int 21h
	
	call newline
	
	mov cl,26
		start1:
			mov dl,n1
			mov ah,02h
			int 21h
			
			mov dx,offset s1
			mov ah,09h
			int 21h
			
			inc n1
		loop start1
	
	call newline
	
	mov dx,offset msg2
	mov ah,09h
	int 21h
	
	call newline
	
	mov cl,26
		start2:
			mov dl,n2
			mov ah,02h
			int 21h
			
			mov dx,offset s1
			mov ah,09h
			int 21h
			
			inc n2
		loop start2
		
	call newline
		
	mov dx,offset msg3
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	mov input1,al
	cmp input1,65
	
	jge check1
	jl check3
		
		check3:
			call newline
			mov dx,offset msg6
			mov ah,09h
			int 21h
			jmp endnn
		
		check1:
			cmp input1,90
			jg check2
			
			call newline
			
			mov dx,offset msg4
			mov ah,09h
			int 21h
			
			call newline
			
			mov dx,offset msg7
			mov ah,09h
			int 21h
			
			sub input1,48
			mov dl,input1
			add dl,32
			add dl,48
			mov ah,02h
			int 21h
			
			jmp endnn
			
		check4:
			cmp input1,122
			jg check3
			
			call newline
			
			mov dx,offset msg5
			mov ah,09h
			int 21h
			
			call newline
			
			mov dx,offset msg8
			mov ah,09h
			int 21h
			
			sub input1,48
			mov dl,input1
			sub dl,32
			add dl,48
			mov ah,02h
			int 21h
			
			jmp endnn
				
		check2:
			cmp input1,97
			jge check4
			jl check3
		
		endnn:
			mov ax,4c00h
			int 21h
	
	proc newline
		mov dl,10
		mov ah,02h
		int 21h
	ret
	endp

end