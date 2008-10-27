CFLAGS=-g -Iinclude -fno-builtin -nostdinc -m32
ASMFLAGS=-felf -g
LDFLAGS=-melf_i386
LINKER=linker.ld

OBJECTS=build/boot.asm.o build/main.c.o build/screen.c.o build/gdt.c.o build/gdt.asm.o build/idt.c.o build/idt.asm.o build/stdlib.c.o build/errors.c.o build/portio.asm.o build/irq.c.o

all: kernel
	echo Done!

kernel: asm c
	ld $(LDFLAGS) -o build/kernel $(OBJECTS) -T$(LINKER)
	cp build/kernel iso/boot/kernel
	mkisofs -R -b boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -boot-info-table -o grub.iso iso
	
asm: src/asm/boot.asm src/asm/gdt.asm src/asm/idt.asm
	mkdir -p build
	nasm $(ASMFLAGS) src/asm/boot.asm -o build/boot.asm.o
	nasm $(ASMFLAGS) src/asm/gdt.asm -o build/gdt.asm.o
	nasm $(ASMFLAGS) src/asm/idt.asm -o build/idt.asm.o
	nasm $(ASMFLAGS) src/asm/portio.asm -o build/portio.asm.o

c: src/c/main.c src/c/screen.c src/c/gdt.c src/c/idt.c src/c/stdlib.c src/c/irq.c src/c/errors.c
	mkdir -p build
	gcc $(CFLAGS) src/c/main.c -c -o build/main.c.o
	gcc $(CFLAGS) src/c/screen.c -c -o build/screen.c.o
	gcc $(CFLAGS) src/c/gdt.c -c -o build/gdt.c.o
	gcc $(CFLAGS) src/c/idt.c -c -o build/idt.c.o
	gcc $(CFLAGS) src/c/stdlib.c -c -o build/stdlib.c.o
	gcc $(CFLAGS) src/c/errors.c -c -o build/errors.c.o
	gcc $(CFLAGS) src/c/irq.c -c -o build/irq.c.o

clean: 
	rm build/*
	rm grub.iso

install:
	cp build/kernel /boot/kernel-GaOS
