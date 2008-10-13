//FILE: main.c

#include<multiboot.h>
#include<screen.h>
#include<gdt.h>
#include<idt.h>

int main(int magic, multiboot_info_t* addr) {
	vga_text_buffer.addr=(u8int*)0xB8000;
	vga_text_buffer.rows=25;
	vga_text_buffer.cols=80;
	kclear();
	puti(vga_text_buffer,0,0,(u32int)&gdt);
	puti(vga_text_buffer,1,0,(u32int)&idt);
	initialize_gdt();
	initialize_idt();
	puts(vga_text_buffer,2,0,"Hello World!");
	return 0x3BADB002;
}
