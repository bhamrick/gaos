//FILE: idt.h

#ifndef IDT_H
#define IDT_H

#include<common.h>

typedef struct idt_entry {
	u16int offset_lo;
	u16int selector;
	u8int zero;
	u8int attr;
	u16int offset_hi;
} idt_entry_t;

typedef void(*handler_t)(u32int,u32int,registers_t);

idt_entry_t idt[256];
handler_t interrupt_handler[256];

void register_interrupt(u32int,handler_t);
void handler_entry_c(u32int,registers_t,u32int);
void make_entry(u32int,u32int,u32int,u32int);
void disable_interrupts();
void enable_interrupts();
extern void initialize_idt();

#endif
