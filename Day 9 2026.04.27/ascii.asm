;Print english alphabet small letters a to z a=97 z=122
.model small
.stack 100h
.data
 msg db "Alphabet letters: $"
.code
main:
	mov ax,@data
	mov ds,ax
	
	mov dx, offset msg
    mov ah, 09h
    int 21h

	mov dl,97
	 
	print_loop:
		mov ah,02h
		int 21h
			
		inc dl
		cmp dl,123            

		jne print_loop
	
		mov ax,4c00h
		int 21h
		
end	main