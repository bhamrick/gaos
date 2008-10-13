//FILE: stdlib.c

#include<stdlib.h>

void* memcpy(void* dest, const void* src, size_t num) {
	u8int *d = (u8int*)dest, *s = (u8int*)src;
	while(num--) {
		*d++ = *s++;
	}
	return dest;
}
