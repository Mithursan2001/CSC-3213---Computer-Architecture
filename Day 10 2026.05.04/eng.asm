.model small
.stack 100h
.data
    msg1  db 'Enter a character : $'
    msg2  db 'This is an Uppercase Letter !!! $'
    msg3  db 'The Lowercase letter of your input is : $'
    msg4  db 'This is NOT an Uppercase Letter.$'
.code
start:
    mov ax, @data
    mov ds, ax
	
    mov dx, offset msg1
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h  
	
    mov bl, al

    cmp bl, 'A'	;65=A,97=a,Z=90,z=122
    jl notupper
    cmp bl, 'Z'
    jg notupper
	
	mov dl,10
	mov ah,02h
	int 21h

    mov dx, offset msg2
    mov ah, 09h
    int 21h
	
	mov dl,10
	mov ah,02h
	int 21h

    mov dx, offset msg3
    mov ah, 09h
    int 21h
	
    add bl, 32  
    mov dl, bl
	
    mov ah, 02h 
    int 21h

    jmp exit
	

notupper:
	mov dl,10
	mov ah,02h
	int 21h
	
    mov dx, offset msg4
    mov ah, 09h
    int 21h
	
exit:
    mov ax, 4c00h
    int 21h

end start