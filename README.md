# cartel: a collection of cross-platform C/C++ toolchains

# EXAMPLE

```console
$ cd example

$ docker run --rm -v "$(pwd):/src" mcandre/cartel:debian-other sh -c "cd /src && mkdir -p bin && arm-linux-gnueabi-gcc -o bin/hello hello.c"

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

# DOCKERHUB

https://hub.docker.com/r/mcandre/cartel

# RUNTIME REQUIREMENTS

* [Docker](https://www.docker.com)

## Recommended

* [objdump](https://linux.die.net/man/1/objdump)
* [coreutils](https://www.gnu.org/software/coreutils/coreutils.html)

# TARGETS

* cloudabi-x86_64
* generic-armel
* linux-glibc-2.28-x86
* linux-glibc-2.28-x86_64
* linux-glibc-2.28-x32
* linux-glibc-2.28-armel
* linux-glibc-2.28-armhf
* linux-glibc-2.28-aarch64
* linux-glibc-2.28-alpha
* linux-glibc-2.28-m68k
* linux-glibc-2.28-mips
* linux-glibc-2.28-mipsel
* linux-glibc-2.28-mips64
* linux-glibc-2.28-mips64el
* linux-glibc-2.28-ppc
* linux-glibc-2.28-ppcspe
* linux-glibc-2.28-ppc64
* linux-glibc-2.28-ppc64le
* linux-glibc-2.28-riscv64
* linux-glibc-2.28-s390x
* linux-glibc-2.28-sh4
* linux-glibc-2.28-sparc64
* linux-musl-x86_64
* wasm64

# SEE ALSO

* [xgo](https://github.com/karalabe/xgo) automates cross-compiling Go applications, including cgo apps with native dependencies.
* [remy](https://github.com/mcandre/remy) generates Rust application ports based on these toolchain images
* [goxcart](https://github.com/mcandre/goxcart) generates Go application ports based on the standard Go toolchain
* [tonixxx](https://github.com/mcandre/tonixxx) provides a more flexible solution for building and testing binaries in many environments in addition to the typical Linux kernel
* [Zig](https://ziglang.org/), a C compatible cross-compiling programming language
