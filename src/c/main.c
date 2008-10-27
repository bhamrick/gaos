//FILE: main.c

#include<multiboot.h>
#include<stdlib.h>
#include<screen.h>
#include<gdt.h>
#include<idt.h>
#include<irq.h>

int main(int magic, multiboot_info_t* addr) {
	vga_text_buffer.addr=(u8int*)0xB8000;
	vga_text_buffer.rows=25;
	vga_text_buffer.cols=80;
	kclear();
	initialize_gdt();
	initialize_idt();
	puts(vga_text_buffer,0,0,"Hello World!");

	install_irq();
	enable_interrupts();

	return 0x3BADB002;
}
