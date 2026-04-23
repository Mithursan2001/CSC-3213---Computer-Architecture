.model small
.stack 100h
.data
msg db "Number $"
n1 db 2
.code
	mov ax, @data
	mov ds, ax
	
	mov dx, offset msg
	mov ah, 09h
	int 21h
	mov dl,10

	mov ah, 02h
	int 21h
	mov dl,n1
	add dl, 48
	mov ah, 02h

	int 21h
	mov ax, 4c00h

	int 21h

end