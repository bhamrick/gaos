section .text

%define MULTIBOOT_HEADER_MAGIC 0x1BADB002
%define MULTIBOOT_HEADER_FLAGS 0x00000003
%define STACK_SIZE 4092

global start, _start
extern main

_start:
start:
jmp multiboot_entry

multiboot_header:
	align 4
	dd MULTIBOOT_HEADER_MAGIC
	dd MULTIBOOT_HEADER_FLAGS
	dd -(MULTIBOOT_HEADER_MAGIC+MULTIBOOT_HEADER_FLAGS)

multiboot_entry:
	mov esp,(stack+STACK_SIZE)	
	push ebx
	push eax
	call main
	add esp,8
	jmp halt

halt:
	hlt
	jmp halt

section .bss

stack: resb STACK_SIZE
