//FILE: main.c

#include<multiboot.h>
#include<screen.h>
#include<gdt.h>

int main(int magic, multiboot_info_t* addr) {
	vga_text_buffer.addr=(u8int*)0xB8000;
	vga_text_buffer.rows=25;
	vga_text_buffer.cols=80;
	kclear();
	initialize_gdt();
	puts(vga_text_buffer,1,0,"Hello World!");
	kputch(0,0,'H',0x07);
	kputch(0,1,'E',0x07);
	kputch(0,2,'L',0x07);
	kputch(0,3,'L',0x07);
	kputch(0,4,'O',0x07);
	kputch(0,5,' ',0x07);
	kputch(0,6,'W',0x07);
	kputch(0,7,'O',0x07);
	kputch(0,8,'R',0x07);
	kputch(0,9,'L',0x07);
	kputch(0,10,'D',0x07);
	kputch(0,11,'!',0x07);
	return 0x3BADB002;
}
