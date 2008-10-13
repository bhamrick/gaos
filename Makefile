CFLAGS=-g -Iinclude -fno-builtin -nostdinc -m32
ASMFLAGS=-felf -g
LDFLAGS=-melf_i386
LINKER=linker.ld

OBJECTS=build/boot.asm.o build/main.c.o build/screen.c.o build/gdt.c.o build/gdt.asm.o

all: kernel
	echo Done!

kernel: asm c
	ld $(LDFLAGS) -o build/kernel $(OBJECTS) -T$(LINKER)
	cp build/kernel iso/boot/kernel
	mkisofs -R -b boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -boot-info-table -o grub.iso iso
	
asm: src/asm/boot.asm
	mkdir -p build
	nasm $(ASMFLAGS) src/asm/boot.asm -o build/boot.asm.o
	nasm $(ASMFLAGS) src/asm/gdt.asm -o build/gdt.asm.o

c:
	mkdir -p build
	gcc $(CFLAGS) src/c/main.c -c -o build/main.c.o
	gcc $(CFLAGS) src/c/screen.c -c -o build/screen.c.o
	gcc $(CFLAGS) src/c/gdt.c -c -o build/gdt.c.o

clean: 
	rm build/*
	rm grub.iso

install:
	cp build/kernel /boot/kernel-GaOS
