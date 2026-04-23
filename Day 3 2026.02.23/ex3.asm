;write an 8086 assembly language program to 
;read two single digit numbers from the keyboard, 
;add them , and display the sum

; Program: Read two single-digit numbers, add them, and display the sum
; Assembler: MASM/TASM (8086)

.model small
.stack 100h
.data
msg1 db 'Enter first digit: $'
msg2 db 0Dh,0Ah,'Enter second digit: $'
msg3 db 0Dh,0Ah,'Sum = $'

.code
main proc
    mov ax, @data
    mov ds, ax

    ; Prompt for first digit
    mov ah, 9
    lea dx, msg1
    int 21h

    ; Read first digit
    mov ah, 1
    int 21h
    sub al, '0'        ; convert ASCII to number
    mov bl, al         ; store first digit in BL

    ; Prompt for second digit
    mov ah, 9
    lea dx, msg2
    int 21h

    ; Read second digit
    mov ah, 1
    int 21h
    sub al, '0'        ; convert ASCII to number
    add bl, al         ; add to first digit

    ; Display result message
    mov ah, 9
    lea dx, msg3
    int 21h

    ; Convert sum to ASCII and display
    mov al, bl
    cmp al, 9
    jbe single_digit   ; if sum <= 9, single digit
    ; handle two-digit sum
    mov ah, 0
    mov cx, 10
    div cl             ; divide AL by 10
    add al, '0'        ; quotient -> ASCII tens
    mov dl, al
    mov ah, 2
    int 21h
    mov al, ah         ; remainder in AH
    add al, '0'
    mov dl, al
    mov ah, 2
    int 21h
    jmp done

single_digit:
    add al, '0'
    mov dl, al
    mov ah, 2
    int 21h

done:
    mov ah, 4Ch
    int 21h
main endp
end main
