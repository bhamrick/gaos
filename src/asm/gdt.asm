; FILE: gdt.asm

section .text
global finish_gdt_init

finish_gdt_init:
	; Set up gdtr
	mov eax,[esp+4]
	mov ebx,[esp+8]
	mov [gdtr+2],eax
	mov [gdtr],bx
	; load the gdt
	lgdt [gdtr]
	
	;reload code segment
	jmp 0x08:.reloadCS

	.reloadCS:
	;reload data segments
	mov ax,0x10
	mov ds,ax
	mov es,ax
	mov fs,ax
	mov gs,ax
	mov ss,ax
	ret

section .data
gdtr:
	dw 0
	dd 0
