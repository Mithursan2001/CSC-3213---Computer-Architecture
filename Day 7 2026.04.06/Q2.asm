; Q2
.model small
.stack 100h
.data
msg1 db 'Enter a three-digit number: $'
msg2 db 0Dh,0Ah,'You entered: $'

digit1 db ?
digit2 db ?
digit3 db ?

.code
main proc
    mov ax,@data
    mov ds,ax

    mov dx,offset msg1
    mov ah,9
    int 21h

    mov ah,1
    int 21h
    mov digit1,al

    mov ah,1
    int 21h
    mov digit2,al

    mov ah,1
    int 21h
    mov digit3,al

    mov dx,offset msg2
    mov ah,9
    int 21h

    mov dl,digit1
    mov ah,2
    int 21h

    mov dl,digit2
    mov ah,2
    int 21h

    mov dl,digit3
    mov ah,2
    int 21h

    mov ah,4Ch
    int 21h
main endp
end main
