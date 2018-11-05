# cartel: a collection of cross-platform C/C++ toolchains

# EXAMPLE

```console
$ cd example

$ docker run --rm -v "$(pwd):/src" mcandre/cartel:linux-arm sh -c "cd /src && mkdir -p bin && arm-linux-gnueabi-gcc -o bin/hello hello.c"

$ objdump -s example/bin/hello | head

example/bin/hello:	file format ELF32-arm-little

Contents of section .interp:
 10154 2f6c6962 2f6c642d 6c696e75 782e736f  /lib/ld-linux.so
 10164 2e3300                               .3.
Contents of section .note.ABI-tag:
 10168 04000000 10000000 01000000 474e5500  ............GNU.
 10178 00000000 03000000 02000000 00000000  ................
Contents of section .note.gnu.build-id:
```

# ABOUT

cartel provides Docker images for convenient access to C/C++ compiler toolchains for a variety of target platforms.

# RUNTIME REQUIREMENTS

* [Docker](https://www.docker.com)

## Recommended

* [objdump](https://linux.die.net/man/1/objdump)
* [coreutils](https://www.gnu.org/software/coreutils/coreutils.html)

# TARGETS

* linux-x86
* linux-x86_64
* linux-arm
