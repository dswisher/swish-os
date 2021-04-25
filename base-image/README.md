# Base Image

This directory contains the docker file (and any supporting files) to build the base image.
The base image contains QEMU and required development tools.


# Testing QEMU

My test scenario for QEMU is to run FreeDOS, per [this article](https://www.cloudsavvyit.com/6719/how-to-use-qemu-to-boot-another-os/).

* `mkdir freedos && cd freedos`
* `qemu-img create -f qcow2 image.img 200M`
* `qemu-system-i386 -hda image.img -cdrom /test-isos/FD12CD.iso -boot order=dc -m 16M -curses -monitor telnet::45454,server,nowait`
* Tinker, then in another shell, `telnet localhost 45454` to access the [QEMU monitor](https://qemu-project.gitlab.io/qemu/system/monitor.html), and `quit` to stop the emulator.

Notes on the above command line:

* `-hda image.img` specifies the disk image to use (created in the first step)
* `-cdrom /test-isos/FD12CD.iso` specifies the CDROM ISO to mount
* `-boot order=dc` specifies the boot order: CDROM then disk
* `-m 16M` specifies the memory
* `-curses` tells QEMU to use curses for output, since we're in a docker shell
* `-monitor telnet::45454,server,nowait` allows telnet access to the QEMU monitor


## Test Files

The test above uses a FreeDOS ISO image.
This takes a while to download, so it is downloaded outside the container, and saved to the ../test-isos directory, which is mounted as /test-isos.
So, the first time you run, it will be slow, but subsequent runs will be much faster.


# Useful Commands

* List installed packages: `apt list --installed`


# Potential Issues

* Installing `qemu-utils` prompted for time zone info (tzdata depdendency, I think). How to make sure tz is set up correctly?


# Possibly Useful Links

- [hadolint](https://github.com/hadolint/hadolint) is used to check the Dockerfile
- QEMU
    - [PC Docs](https://wiki.qemu.org/Documentation/Platforms/PC)
    - [FreeDOS under QEMU example](https://www.cloudsavvyit.com/6719/how-to-use-qemu-to-boot-another-os/)
    - [How to quit QEMU](https://superuser.com/questions/1087859/how-to-quit-the-qemu-monitor-when-not-using-a-gui)

