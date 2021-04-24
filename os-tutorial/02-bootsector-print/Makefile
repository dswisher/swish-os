# This Makefile is intended to run inside the docker container.

# SRCFILE := boot1.asm
SRCFILE := boot_sect_hello.asm
BINFILE := disk.img

compile: $(BINFILE)

$(BINFILE) : $(SRCFILE)
	nasm -f bin $(SRCFILE) -o $(BINFILE)

run: $(BINFILE)
	qemu-system-i386 -curses -monitor telnet::45454,server,nowait -drive format=raw,file=disk.img

clean:
	rm -f $(BINFILE)

