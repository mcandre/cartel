FROM library/debian:buster
RUN apt-get update && \
    apt-get install -y \
        gcc-alpha-linux-gnu \
        gcc-arm-linux-gnueabi \
        gcc-arm-linux-gnueabihf \
        gcc-arm-none-eabi \
        gcc-aarch64-linux-gnu \
        gcc-m68k-linux-gnu \
        gcc-mips-linux-gnu \
        gcc-mipsel-linux-gnu \
        gcc-mips64-linux-gnuabi64 \
        gcc-mips64el-linux-gnuabi64 \
        gcc-powerpc-linux-gnu \
        gcc-powerpc-linux-gnuspe \
        gcc-powerpc64-linux-gnu \
        gcc-powerpc64le-linux-gnu \
        gcc-riscv64-linux-gnu \
        gcc-s390x-linux-gnu
