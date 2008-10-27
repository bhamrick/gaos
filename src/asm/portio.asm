;FILE: portio.asm

section .text
global outb, inb

; void outb(u16int port, u8int byte);
outb:
	push ebp
	mov ebp,esp
	push eax
	push edx
	xor edx,edx
	xor eax,eax
	; I hope this is the correct calling convention...
	mov dx,[ebp+8]
	mov al,[ebp+12]
	out dx,al
	pop edx
	pop eax
	pop ebp
	ret

; u8int inb(u16int port);
inb:
	push ebp
	mov ebp,esp
	push edx
	xor edx,edx
	xor eax,eax
	
	mov dx,[ebp+8]
	in al,dx
	
	pop edx
	pop ebp
	ret
