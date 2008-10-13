//FILE: gdt.c

#include<gdt.h>

gdt_entry_t make_gdt_entry(u32int base, u32int limit, u8int access, u8int flags) {
	gdt_entry_t entry;
	entry.lim_low = limit&0xFFFF;
	entry.lim_hi = (limit>>16)&0xF;
	entry.base_low = base&0xFFFF;
	entry.base_mid = (base>>16)&0xFF;
	entry.base_hi = (base>>24)&0xFF;
	entry.access=access;
	entry.flags=flags;
	return entry;
}

void initialize_gdt() {
	gdt[0] = make_gdt_entry(0,0,0,0);
	gdt[1] = make_gdt_entry(0x00000000,0xFFFFF,0x9A,0x6);
	gdt[2] = make_gdt_entry(0x00000000,0xFFFFF,0x92,0x6);
	gdt[3] = make_gdt_entry(0x00000000,0xFFFFF,0x89,0x6);
	puti(vga_text_buffer,2,0,&gdt);
	puti(vga_text_buffer,3,0,sizeof(gdt));
	finish_gdt_init(&gdt,sizeof(gdt));
}
