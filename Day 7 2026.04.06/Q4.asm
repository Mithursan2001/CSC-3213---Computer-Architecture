.model small
.stack 100h
.data
msg1 db 'Enter mark (0-100): $'
msgA db 0Dh,0Ah,'Grade: A$'
msgB db 0Dh,0Ah,'Grade: B$'
msgC db 0Dh,0Ah,'Grade: C$'
msgD db 0Dh,0Ah,'Grade: D$'
msgF db 0Dh,0Ah,'Grade: Fail$'

mark db ?

.code
main proc
    mov ax,@data
    mov ds,ax

    ; Prompt user
    mov dx,offset msg1
    mov ah,9
    int 21h

    ; Read two digits (for simplicity, assume 2-digit input)
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
    mov mark,al

    ; Compare ranges
    mov al,mark
    cmp al,90
    jae gradeA

    cmp al,75
    jae gradeB

    cmp al,60
    jae gradeC

    cmp al,50
    jae gradeD

    jmp gradeF

gradeA:
    mov dx,offset msgA
    mov ah,9
    int 21h
    jmp done

gradeB:
    mov dx,offset msgB
    mov ah,9
    int 21h
    jmp done

gradeC:
    mov dx,offset msgC
    mov ah,9
    int 21h
    jmp done

gradeD:
    mov dx,offset msgD
    mov ah,9
    int 21h
    jmp done

gradeF:
    mov dx,offset msgF
    mov ah,9
    int 21h

done:
    mov ah,4Ch
    int 21h
main endp
end main
