:Q5
.model small
.stack 100h
.data
msg1 db 'Enter side a (two digits): $'
msg2 db 0Dh,0Ah,'Enter side b (two digits): $'
msg3 db 0Dh,0Ah,'Enter side c (two digits): $'
msgValid db 0Dh,0Ah,'The sides form a valid triangle.$'
msgInvalid db 0Dh,0Ah,'The sides do NOT form a valid triangle.$'

a db ?
b db ?
c db ?

.code
main proc
    mov ax,@data
    mov ds,ax

    ; Input side a
    mov dx,offset msg1
    mov ah,9
    int 21h
    call readTwoDigit
    mov a,al

    ; Input side b
    mov dx,offset msg2
    mov ah,9
    int 21h
    call readTwoDigit
    mov b,al

    ; Input side c
    mov dx,offset msg3
    mov ah,9
    int 21h
    call readTwoDigit
    mov c,al

    ; Check conditions
    mov al,a
    add al,b
    cmp al,c
    jbe invalid

    mov al,a
    add al,c
    cmp al,b
    jbe invalid

    mov al,b
    add al,c
    cmp al,a
    jbe invalid

    ; If all passed
    mov dx,offset msgValid
    mov ah,9
    int 21h
    jmp done

invalid:
    mov dx,offset msgInvalid
    mov ah,9
    int 21h

done:
    mov ah,4Ch
    int 21h
main endp

; Procedure to read two-digit number
readTwoDigit proc
    mov ah,1
    int 21h
    sub al,30h
    mov bl,al
    mov ah,1
    int 21h
    sub al,30h
    mov bh,al
    mov al,bl
    mov cl,10
    mul cl
    add al,bh
    ret
readTwoDigit endp
end main
