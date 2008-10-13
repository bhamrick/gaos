//FILE: idt.c

#include<idt.h>

void register_interrupt(u32int inum, handler_t handler) {
	interrupt_handler[inum]=handler;
}

void handler_entry_c(u32int inum, registers_t regs) {
	(*interrupt_handler[inum])(inum,regs);
}

void make_entry(u32int inum, u32int offset, u32int selector, u32int attr) {
	idt[inum].offset_lo = offset&0xFFFF;
	idt[inum].offset_hi = offset>>16;
	idt[inum].zero=0;
	idt[inum].attr=(u8int)attr;
	idt[inum].selector=(u16int)selector;
}

void disable_interrupts() {
	asm volatile("cli");
}

void enable_interrupts() {
	asm volatile("sti");
}
