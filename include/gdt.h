//FILE: gdt.h

#ifndef GDT_H
#define GDT_H

#include<common.h>
#include<screen.h>

extern reload_segments();

typedef struct gdt_entry {
	u16int lim_low;
	u16int base_low;
	u8int base_mid;
	u8int access;
	u8int flags:4;
	u8int lim_hi:4;
	u8int base_hi;
} gdt_entry_t;

gdt_entry_t gdt[4];

gdt_entry_t make_gdt_entry(u32int,u32int,u8int,u8int);

void initialize_gdt();

#endif
