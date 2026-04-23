;write anAssembly program to comapare two numbers.
;Display the greater number
.model small
.stack 100h
.data
	num1 db 5
	num2 db 3
	msg1 db "Greater number is:  $"
.code
main:
	mov ax,@data
	mov ds,ax
	
	;load numbers into registers
	mov al,num1
	mov bl,num2
	
	;compare numbers
	cmp al,bl
	jpe FG	; If al >= bl,  jump to FG
	
	SG:
		;Display message
		mov dx,offset msg1
		mov ah,09h
		int 21h		
	
		;Dispay number
		mov dl,num2
		add dl,48
		mov ah,02h
		int 21h
		
		jmp Exit
		
	FG:
		;Display message
		mov dx,offset msg1
		mov ah,09h
		int 21h		
	
		;Dispay number
		mov dl,num1
		add dl,48
		mov ah,02h
		int 21h
			
	Exit:
		;Exit program
		mov ax,4c00h
		int 21h
end