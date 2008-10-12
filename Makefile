CFLAGS=-g -Iinclude -fno-builtin -nostdinc -m32
ASMFLAGS=-felf -g
LDFLAGS=-melf_i386
LINKER=linker.ld

OBJECTS=build/boot.asm.o build/main.c.o

all: kernel
	echo Done!

kernel: asm c
	ld $(LDFLAGS) -o build/kernel $(OBJECTS) -T$(LINKER)
	cp build/kernel iso/boot/kernel
	mkisofs -R -b boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -boot-info-table -o grub.iso iso
	
asm: src/asm/boot.asm
	mkdir -p build
	nasm $(ASMFLAGS) src/asm/boot.asm -o build/boot.asm.o

c:
	mkdir -p build
	gcc $(CFLAGS) src/c/main.c -c -o build/main.c.o

clean: 
	rm build/*
	rm grub.iso

install:
	cp build/kernel /boot/kernel-GaOS
