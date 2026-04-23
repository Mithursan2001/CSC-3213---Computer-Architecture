;write an assembly program to input three marks, 
;calculate the average, 
;and print if the student passed(average >= 50)



; It's not correct code
.model small
.stack 100h
.data
msg1 db "Enter the marks 1 : $"
msg2 db "Enter the marks 2 : $"
msg3 db "Enter the marks 3 : $"
msg4 db "Average is : $"
msg5 db "Pass $"
msg6 db "Fail $"
t db 0	
o db 0
dig1 db 0
dig2 db 0
dig3 db 0
dig4 db 0
dig5 db 0
dig6 db 0
n1 db 3
r db 0

.code
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg1
	mov ah,09h
	int 21h
	
	mov ah,01h	
	int 21h
	
	sub al,48	
	mov t,al	
	
	mov ah,01h	
	int 21h		
	
	sub al,48	
	mov o,al	
	
	mov bl,10
	
	mov al,t	
	mul bl		
	
	add al,o	
	
	mov dig1,al	

	mov dl,10	
	mov ah,02h
	int 21h
	
	mov al,dig1
	mov ah,00
	
	div bl	
	
	mov r,ah		
	
	mov dx,offset msg2	
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	sub al,48	
	mov t,al	
	

	mov ah,01h	
	int 21h		
	
	sub al,48	
	mov o,al	
	
	mov bl,10
	
	mov al,t	
	mul bl		
	
	add al,o	
	
	mov dig2,al	
	
	mov al,dig2
	mov ah,00
	
	div bl		
	
	mov r,ah	
	
	mov dl,10	
	mov ah,02h
	int 21h
	
	mov dx,offset msg3
	mov ah,09h
	int 21h
	
	mov ah,01h	
	int 21h
	
	sub al,48	
	mov t,al	
	
	mov ah,01h	
	int 21h		
	
	sub al,48	
	mov o,al	
	
	mov bl,10
	
	mov al,t	
	mul bl		
	
	add al,o	
	
	mov dig3,al	

	mov dl,10	
	mov ah,02h
	int 21h
	
	mov al,dig3
	mov ah,00
	
	div bl	
	
	mov r,ah		
	
	
	mov dx,offset msg4
	mov ah,09h
	int 21h
	
	mov dl,dig1	
	add dl,dig2	
	
	mov dig4,dl	
	
	mov dl,dig4
	add dl,dig3
	
	mov dig5,dl	
	
	mov al,dig5
	mov ah,00			
	
	mov al,dig5	;get div
	div n1
	mov dig6,ah
	mov dl,al
	
	div bl
	mov r,ah
	
	mov dl,al
	add dl,48
	mov ah,02h
	int 21h
	
	mov dl,r
	add dl,48
	mov ah,02h
	int 21h

	mov r,al
	
	mov dl,10	
	mov ah,02h
	int 21h
	
	cmp al,50
	jl FAIL
		

	
	PASS:
		mov dx,offset msg5
		mov ah,09h
		int 21h
		jmp EXIT
		
	FAIL:
		mov dx,offset msg6
		mov ah,09h
		int 21h
		
	EXIT:
		mov ax,4c00h
		int 21h
end