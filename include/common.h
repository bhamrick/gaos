// FILE: common.h

#ifndef COMMON_H
#define COMMON_H

typedef unsigned char      u8int;
typedef          char      s8int;
typedef unsigned short     u16int;
typedef          short     s16int;
typedef unsigned int       u32int;
typedef          int       s32int;
typedef unsigned long long u64int;
typedef          long long s64int;

typedef unsigned int       size_t;

typedef struct registers {
	u32int eax;
	u32int ebx;
	u32int ecx;
	u32int edx;
	u32int esi;
	u32int edi;
} registers_t;

#endif
