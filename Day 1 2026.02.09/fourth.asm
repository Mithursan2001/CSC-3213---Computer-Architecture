.model small
.stack 100h
.data
msg db "Hello",10,"world $"
.code
	mov ax, @data
	mov ds, ax
	
	mov dx, offset msg
	mov ah, 09h
	int 21h
	
	mov ax, 4c00h
	int 21h
end