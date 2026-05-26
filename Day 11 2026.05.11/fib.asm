.model small
.stack 100h

.data
    msg1 db "Enter number : $"
    msg2 db "Fibonacci Series : $"

    n db ?
    n1 db ?
    n2 db ?

    a db 0
    b db 1
    c db ?

.code
main:
    mov ax,@data
    mov ds,ax

    mov dx,offset msg1
    mov ah,09h
    int 21h

    call ReadInt
    mov n,al

    call newLine

    mov dx,offset msg2
    mov ah,09h
    int 21h

    mov al,a
    call printNo

    mov dl,' '
    mov ah,02h
    int 21h

    mov al,b
    call printNo

    mov cl,n
    sub cl,2

start1:
    mov al,a
    add al,b
    mov c,al

    mov dl,' '
    mov ah,02h
    int 21h

    call printNo

    mov al,b
    mov a,al

    mov al,c
    mov b,al

loop start1

    mov ax,4c00h
    int 21h

proc ReadInt
    mov ah,01h
    int 21h
    sub al,48
    mov n1,al

Read:
    mov ah,01h
    int 21h
    cmp al,0dh
    je Exit

    sub al,48
    mov n2,al

    mov al,n1
    mov bl,10
    mul bl
    add al,n2
    mov n1,al

    jmp Read

Exit:
    mov al,n1
ret
endp

proc newLine
    mov dl,0ah
    mov ah,02h
    int 21h
ret
endp

proc printNo
    mov ah,00
    mov bl,10
    div bl

    mov dl,al
    add dl,48
    mov ah,02h
    int 21h

    mov dl,ah
    add dl,48
    mov ah,02h
    int 21h
ret
endp

end main