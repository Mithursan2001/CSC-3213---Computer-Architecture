;jump function(n=5 Hai or Bye)
.model small
.stack 100h
.data
	msg db "Enter a number: $"
	msg1 db "even",10,"$"
	msg2 db "odd",10,"$"
.code
start:
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	sub al,48
	
	mov ah,00
	mov bl,2 ; bl is temporary register
	div bl 	; find reminder
	
	cmp ah,0;reminder(0) = 0
	
	mov dl,10
	mov ah,02h
	int 21h
	
	je Lb1even
	jne Lb1odd
	
	Lb1even:
		mov dx,offset msg1
		mov ah,09h
		int 21h
		jmp Endnn
		
	Lb1odd:
		mov dx,offset msg2
		mov ah,09h
		int 21h
		
	Endnn:
		mov ax,4c00h
		int 21h
end start