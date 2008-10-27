//FILE: irq.c

#include<irq.h>
#include<screen.h>

void irq_handler(u32int inum, u32int errcode, registers_t regs) {
	puti(vga_text_buffer,0,78,inum);
	if(inum >= 40) {
		outb(0xA0,0x20);
	}
	outb(0x20,0x20);
}

void remap_irq() {
	//remap irqs to 32-47
	outb(0x20,0x11);
	outb(0xA0,0x11);
	outb(0x21,0x20);
	outb(0xA1,0x28);
	outb(0x21,0x04);
	outb(0xA1,0x02);
	outb(0x21,0x01);
	outb(0xA1,0x01);
	outb(0x21,0x00);
	outb(0xA1,0x00);
}

void install_irq() {
	int i;
	remap_irq();
	
	for(i = 32; i<=47; i++) {
		register_interrupt(i,irq_handler);
	}
}
