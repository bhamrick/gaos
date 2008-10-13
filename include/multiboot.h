// FILE: multiboot.h

#ifndef MULTIBOOT_H
#define MULTIBOOT_H

#include<common.h>

typedef struct elf_header_info {
	u32int num;
	u32int size;
	u32int addr;
	u32int shndx;
} elf_header_info_t;

typedef struct aout_symbol_info {
	u32int tabsize;
	u32int strsize;
	u32int addr;
	u32int reserved;
} aout_symbol_info_t;

typedef struct multiboot_info {
	u32int flags;
	u32int mem_lower;
	u32int mem_upper;
	u32int boot_device;
	u32int cmdline;
	u32int mods_count;
	u32int mods_addr;
	union {
		elf_header_info_t elf;
		aout_symbol_info_t aout;
	} syms;
	u32int mmap_length;
	u32int mmap_addr;
	u32int drives_length;
	u32int drives_addr;
	u32int config_table;
	u32int boot_loader_name;
	u32int apm_table;
	u32int vbe_control_info;
	u32int vbe_mode_info;
	u32int vbe_mode;
	u32int vbe_interface_seg;
	u32int vbe_interface_off;
	u32int vbe_interface_len;
} multiboot_info_t;

#endif
