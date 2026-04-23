.model small
.stack 100h
.data
msg1 db "Enetr the Number: $"
t db 0	;23
o db 0
dig db 0
r db 0

.code
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg1	;read message
	mov ah,09h
	int 21h
	
	;read first digit
	mov ah,01h	;al=50
	int 21h
	
	sub al,48	;al-48=2
	mov t,al	;t=2
	
	;read second digit
	mov ah,01h	;al=51
	int 21h		
	
	sub al,48	;al-48=3
	mov o,al	;o=3
	
	;t=2 o=3	t*10+3=23
	mov bl,10
	
	mov al,t	;al=t=2
	mul bl		;al=al*bl=2*10=20
	
	add al,o	;al=al+o=20+3=23
	
	mov dig,al	;dig=23/10=2 reminder=3

	mov dl,10	;next line
	mov ah,02h
	int 21h	
	
	mov al,dig
	mov ah,00	
	div bl		;al/bl=23/10=2 ah=3
	
	mov r,ah	;r=3	
	
	;print 2
	mov dl,al
	add dl,48
	mov ah,02h
	int 21h
	
	;print 3
	mov dl,r
	add dl,48
	mov ah,02h
	int 21h
	
	mov ax,4c00h
	int 21h
end