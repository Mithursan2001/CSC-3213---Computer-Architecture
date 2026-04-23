.model small
.stack 100h
.data
msg1 db "Enetr the Number 01: $"
msg2 db "Enter the number 02: $"
msg3 db "The sum is : $"
msg4 db "The subraction is : $"
t1 db 0	
o1 db 0
dig1 db 0
r1 db 0
t2 db 0	
o2 db 0
dig2 db 0
r2 db 0

.code
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg1	;read message 1
	mov ah,09h
	int 21h
	
	;read first digit
	mov ah,01h	;al=50
	int 21h
	
	sub al,48	;al-48=2
	mov t1,al	;t=2
	
	;read second digit
	mov ah,01h	;al=51
	int 21h		
	
	sub al,48	;al-48=3
	mov o1,al	;o=3
	
	;t=2 o=3	t*10+3=23
	mov bl,10
	
	mov al,t1	;al=t=2
	mul bl		;al=al*bl=2*10=20
	
	add al,o1	;al=al+o=20+3=23
	
	mov dig1,al	

	mov dl,10	;next line
	mov ah,02h
	int 21h
	
	
	mov dx,offset msg2	;read message 2
	mov ah,09h
	int 21h
	
	;read first digit
	mov ah,01h	;al=50
	int 21h
	
	sub al,48	;al-48=2
	mov t2,al	;t=2
	
	;read second digit
	mov ah,01h	;al=51
	int 21h		
	
	sub al,48	;al-48=3
	mov o2,al	;o=3
	
	;t=2 o=3	t*10+3=23
	mov bl,10
	
	mov al,t2	;al=t=2
	mul bl		;al=al*bl=2*10=20
	
	add al,o2	;al=al+o=20+3=23
	
	mov dig2,al	
		
	
	mov dl,10	;next line
	mov ah,02h
	int 21h
	
	
	mov dx,offset msg3	;print message 3
	mov ah,09h
	int 21h
	
	mov bl,10
	mov dl,dig1	;get sum
	add dl,dig2	
	
	mov al,dl	
	mov ah,00
	div bl		;al/bl=23/10=2 ah=3
	
	mov r1,ah	;r=3	
	
	;print 
	mov dl,al
	add dl,48
	mov ah,02h
	int 21h
	
	;print 
	mov dl,r1
	add dl,48
	mov ah,02h
	int 21h
	
	mov dl,10	;next line
	mov ah,02h
	int 21h
	
	mov dx,offset msg4	;print message 4
	mov ah,09h
	int 21h
	
	mov bl,10
	mov dl,dig1	;get sum
	sub dl,dig2	
	
	mov al,dl	
	mov ah,00
	div bl		;al/bl=23/10=2 ah=3
	
	mov r1,ah	;r=3	
	
	;print 
	mov dl,al
	add dl,48
	mov ah,02h
	int 21h
	
	;print 
	mov dl,r1
	add dl,48
	mov ah,02h
	int 21h
	
	
	mov ax,4c00h
	int 21h
end