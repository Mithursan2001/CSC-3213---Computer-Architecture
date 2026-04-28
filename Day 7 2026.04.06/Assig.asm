; Q1
.model small
.stack 100h
.data
msg1 db "Enter the first two-digit number: $"
msg2 db "Enter a second two-digit number: $"
msg3 db "Sum: $"
msg4 db "Difference: $"
msg5 db "Quotient: $"
msg6 db "Remainder: $"
t db 0	
o db 0
dig1 db 0
dig2 db 0
dig3 db 0
dig4 db 0
r db 0
n3 db 0

.code
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg1	
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	sub al,48	
	mov t,al
	
	mov ah,01h
	int 21h		
	
	sub al,48
	mov o,al

	mov bl,10	
	mov al,t	
	mul bl	
	add al,o	
	mov dig1,al

	mov dl,10
	mov ah,02h
	int 21h
	
	mov al,dig1
	mov ah,00
	
	div bl
	
	mov r,ah
	
	mov dx,offset msg2
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	sub al,48
	mov t,al
	
	mov ah,01h
	int 21h		
	
	sub al,48
	mov o,al

	mov bl,10
	
	mov al,t
	mul bl	
	add al,o
	mov dig2,al
	
	mov al,dig2
	mov ah,00	
	div bl
	mov r,ah
	
	mov dl,10
	mov ah,02h
	int 21h
		
	mov dx,offset msg3
	mov ah,09h
	int 21h
	
	mov dl,dig1
	add dl,dig2	
	
	mov dig3,dl
	
	mov al,dig3
	mov ah,00	
	div bl	
	mov r,ah	
	
	mov dl,al
	add dl,48
	mov ah,02h
	int 21h

	mov dl,r
	add dl,48
	mov ah,02h
	int 21h
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov dx,offset msg4
	mov ah,09h
	int 21h
	
	mov bl,10
	mov dl,dig1	
	sub dl,dig2	
	
	mov al,dl	
	mov ah,00
	div bl
	
	mov dig4,ah	

	mov dl,al
	add dl,48
	mov ah,02h
	int 21h

	mov dl,dig4
	add dl,48
	mov ah,02h
	int 21h
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov dx,offset msg5
	mov ah,09h
	int 21h
		
	mov ah,00
		
	mov al,dig1
	div dig2
	mov n3,ah

	mov dl,al
	add dl,48
	mov ah,02h
	int 21h
	
	mov dl,10
	mov ah,02h
	int 21h
	
	mov dx,offset msg6
	mov ah,09h
	int 21h
	
	mov bl,10
	mov dl,n3

	add dl,48
	mov ah,02h
	int 21h
	
	mov ax,4c00h
	int 21h
end