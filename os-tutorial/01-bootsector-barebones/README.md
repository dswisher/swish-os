
[Tutorial](https://github.com/cfenollosa/os-tutorial/tree/master/01-bootsector-barebones)

I could not get the supplied `boot_sect_simple.asm` to work.
Looking at the article [Writing a Bootloader](http://3zanders.co.uk/2017/10/13/writing-a-bootloader/), I switched to `boot1.asm`.
That works.

```
SeaBIOS (version 1.13.0-1ubuntu1.1)


iPXE (http://ipxe.org) 00:03.0 CA00 PCI2.10 PnP PMM+07F8CB00+07ECCB00 CA00



Booting from Hard Disk...
Boot failed: could not read the boot disk

Booting from Floppy...
Hello world!
```

So, what was wrong with `boot_sect_simple.asm`?
It appears a trailing `.` was the culprit, on the last line.
That is not present in the source; I'm not sure where it came from.

Using `-fda` on the QEMU command line boots from floppy, `-hdc` boots from hard drive.
Using `-drive format=raw,file=disk.img` also boots from hard drive, and eliminates the "raw format" warning.


# Other Links

* [Writing an x86 "Hello world" bootloader with assembly](https://50linesofco.de/post/2018-02-28-writing-an-x86-hello-world-bootloader-with-assembly)
* [How to write a simple operating system](http://mikeos.sourceforge.net/write-your-own-os.html) (MikeOS)

