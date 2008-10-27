//FILE: errors.c

#include<errors.h>
#include<screen.h>

void error_handler(u32int errno, registers_t regs, u32int errcode) {
	puts(vga_text_buffer,23,0,"Error number:");
	puts(vga_text_buffer,24,0,"Error code:");
	puti(vga_text_buffer,23,15,errno);
	puti(vga_text_buffer,24,13,errcode);
}
