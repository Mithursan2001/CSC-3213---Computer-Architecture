.model small
.stack 100h
.data
	msg1 db "Enter radius(r): $"
	msg2 db "Enter height(h): $"
	msg3 db "Volume of Cylinder      : $"
	msg4 db "Volume of Cone          : $"
	msg5 db "Remaining Volume        : $"
	msg6 db "Surface Area of Cylinder: $"
	radius db 0
	height db 0
	vcyl db 0
	vcone db 0
.code
start:	
	mov ax,@data
	mov ds,ax
	
	mov dx,offset msg1
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	sub al,48
	mov radius,al
	
	call newline
	
	mov dx,offset msg2
	mov ah,09h
	int 21h
	
	mov ah,01h
	int 21h
	
	sub al,48
	mov height,al
	
	call newline
	call newline
	
	mov al,radius
	mul radius
	mov cl,3
	mul cl
	mul height
	mov vcyl,al
	
	mov al,vcyl
	mov ah,00
	mov cl,3
	div cl
	mov vcone,al
	
	mov dx,offset msg3
	mov ah,09h
	int 21h
	
	mov al,vcyl
	mov ah,00
	call print_num
	call newline
	
	mov dx,offset msg4
	mov ah,09h
	int 21h
	
	mov al,vcone
	mov ah,00
	call print_num
	call newline
	
	mov dx,offset msg5
	mov ah,09h
	int 21h
	
	mov al,vcyl
	sub al,vcone
	mov ah,00
	call print_num
	call newline

	mov dx,offset msg6
	mov ah,09h
	int 21h
	
	mov al,radius
	add al,height
	mul radius
	mov cl,6
	mul cl
	mov ah,00
	call print_num
	
	mov ax,4c00h
	int 21h
	
	proc print_num
		mov ah,00
		mov bl,100
		div bl
		
		mov cl,ah
		
		mov dl,al
		add dl,48
		mov ah,02h
		int 21h
		
		mov al,cl
		mov ah,00
		mov bl,10
		div bl
		
		mov cl,ah
		
		mov dl,al
		add dl,48
		mov ah,02h
		int 21h
		
		mov dl,cl
		add dl,48
		mov ah,02h
		int 21h
		
	ret
	endp
	
	proc newline
		mov dl,10
		mov ah,02h
		int 21h
	ret
	endp

end start