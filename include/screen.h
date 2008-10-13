// FILE: screen.h

#ifndef SCREEN_H
#define SCREEN_H

#include<common.h>

typedef struct text_buffer_info {
	u8int* addr;
	u32int rows, cols;
} text_buffer_info_t;

void putch(text_buffer_info_t,u32int,u32int,u8int,u8int);
void kputch(u32int,u32int,u8int,u8int);
void puts(text_buffer_info_t,u32int,u32int,char*);
void clear(text_buffer_info_t);
void puti(text_buffer_info_t,u32int,u32int,u32int);
void kclear();

text_buffer_info_t vga_text_buffer;

#endif
