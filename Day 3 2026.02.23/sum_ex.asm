;write an 8086 assembly language program to 
;read two single digit numbers from the keyboard, 
;add them , and display the sum

.model small
.stack 100h
.data
	m1 db "Enter the number 01: $"
	m2 db "Enter the number 02: $"
	m3 db "The sum is : $"
	n1 db 0
	n2 db 0
.code
start:
	mov ax,@data
	mov ds,ax
	
	mov dx,offset m1	;print message 1
	mov ah,09h
	int 21h
	
	mov ah,01h	;read input 1
	int 21h
	
	sub al,48
	mov n1,al
	
	mov dl,10	;next line
	mov ah,02h
	int 21h
	
	mov dx,offset m2	;print message 2
	mov ah,09h
	int 21h
		
	mov ah,01h	;read input 2
	int 21h
	
	sub al,48
	mov n2,al
	
	mov dl,10	;next line
	mov ah,02h
	int 21h
	
	mov dx,offset m3	;print message 3
	mov ah,09h
	int 21h
	
	mov dl,n1	;get sum
	add dl,n2
	
	add dl,48	;print sum
	mov ah,02h
	int 21h
	
	mov ax,4c00h
	int 21h
	
end start	