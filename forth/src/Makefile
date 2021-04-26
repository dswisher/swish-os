# This Makefile is intended to run inside the docker container.

BINFILE := disk.img

compile: $(BINFILE)

$(BINFILE): bootloader.bin kernel.bin
	# TODO: Is there a better way to handle this?
	cat bootloader.bin kernel.bin > $(BINFILE)

run: $(BINFILE)
	qemu-system-i386 -curses -monitor telnet::45454,server,nowait -drive format=raw,file=disk.img

bootloader.bin: bootloader.asm
	nasm -f bin $< -o $@

kernel.bin: kernel.asm
	nasm -f bin $< -o $@

clean:
	rm -f $(BINFILE) bootloader.bin kernel.bin

