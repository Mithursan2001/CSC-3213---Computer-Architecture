.model small
.stack 100h
.data
	m1 db "Enter the number 01: $"
	n1 db 0
	m2 db "Enter the number 02: $"
	n2 db 1
.code
start:
	mov ax,@data
	mov ds,ax
	
	mov dx,offset m1	;num01 =2
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	mov n1,al
	mov dl,nl
	add dl,48
	mov ah,02h
	int 21h
	
	mov ah,01h
	int 21h
	
	mov n2,al
	mov dl,n2
	add dl,48
	mov ah,02h
	int 21h
	
	mov ax,4c00h
	int 21h
	
end start	