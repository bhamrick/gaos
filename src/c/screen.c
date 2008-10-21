//FILE: screen.c

#include<screen.h>

void putch(text_buffer_info_t buffer, u32int row, u32int col, u8int ch, u8int attr) {
	u8int* where = (u8int*)(buffer.addr + 2*(row*buffer.cols + col));
	*where = ch;
	*(where+1) = attr;
}

void clear(text_buffer_info_t buffer) {
	u32int addr = (u32int)buffer.addr, max_addr = (u32int)(buffer.addr + buffer.rows*buffer.cols*2);
	for(; addr<max_addr; addr++)
		*((u8int*)addr)=0;
}

void kclear() {
	u32int addr = 0xB8000, max_addr=0xB8FA0;
	for(; addr<max_addr; addr++)
		*((u8int*)addr)=0;
	vga_text_buffer.pos.row = 0;
	vga_text_buffer.pos.col = 0;
}

void puts(text_buffer_info_t buffer, u32int row, u32int col, char* str) {
	u32int where = (u32int)(buffer.addr+2*(row*buffer.cols+col)), max_addr=(u32int)(buffer.addr+2*buffer.rows*buffer.cols);
	while(*str && where < max_addr) {
		*(u8int*)where=*str;
		where++;
		*(u8int*)where=0x07;
		where++;
		str++;
	}
}

void puti(text_buffer_info_t buffer, u32int row, u32int col, u32int num) {
	char str[17];
	int i = 15;
	str[16]=0;
	do {
		str[i]=num%10+0x30;
		num/=10;
		i--;
	} while(num);
	puts(buffer,row,col,(str+i)+1);
}

void kputch(u8int ch, u8int attr) {
	u8int* where = (u8int*)(vga_text_buffer.addr + 2*(vga_text_buffer.pos.row*vga_text_buffer.cols + vga_text_buffer.pos.col));
	*where = ch;
	*(where+1) = attr;
	vga_text_buffer.pos.col++;
	if(vga_text_buffer.pos.col >= vga_text_buffer.cols) {
		vga_text_buffer.pos.col=0;
		vga_text_buffer.pos.row++;
		if(vga_text_buffer.pos.row >= vga_text_buffer.rows) {
			vga_text_buffer.pos.row--;
			scrollup(vga_text_buffer);
		}
	}
}

void scrollup(text_buffer_info_t buffer) {
	int r, c;
	u8int* where = (u8int*)(vga_text_buffer.addr);
	u32int offset = buffer.rows*2;
	for(r = 0; r<buffer.rows-1; r++) {
		for(c=0; c<buffer.cols; c++) {
			*where = *(where+offset);
		}
	}
}
