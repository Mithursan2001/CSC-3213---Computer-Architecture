;Q3
.model small
.stack 100h
.data
msg1 db 'Enter a three-digit number: $'
msgPal db 0Dh,0Ah,'The number is a palindrome.$'
msgNot db 0Dh,0Ah,'The number is not a palindrome.$'

digit1 db ?
digit2 db ?
digit3 db ?

.code
main proc
    mov ax,@data
    mov ds,ax

    ; Prompt user
    mov dx,offset msg1
    mov ah,9
    int 21h

    ; Read first digit
    mov ah,1
    int 21h
    mov digit1,al

    ; Read second digit
    mov ah,1
    int 21h
    mov digit2,al

    ; Read third digit
    mov ah,1
    int 21h
    mov digit3,al

    ; Compare first and last digit
    mov al,digit1
    cmp al,digit3
    jne notPalindrome

    ; If equal → palindrome
    mov dx,offset msgPal
    mov ah,9
    int 21h
    jmp done

notPalindrome:
    mov dx,offset msgNot
    mov ah,9
    int 21h

done:
    mov ah,4Ch
    int 21h
main endp
end main
