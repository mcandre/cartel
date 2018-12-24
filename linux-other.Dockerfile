FROM library/debian:buster
RUN apt-get update && \
    apt-get install -y \
        g++-alpha-linux-gnu \
        g++-arm-linux-gnueabi \
        g++-arm-linux-gnueabihf \
        gcc-arm-none-eabi \
        g++-aarch64-linux-gnu \
        g++-m68k-linux-gnu \
        g++-mips-linux-gnu \
        g++-mipsel-linux-gnu \
        g++-mips64-linux-gnuabi64 \
        g++-mips64el-linux-gnuabi64 \
        g++-powerpc-linux-gnu \
        g++-powerpc-linux-gnuspe \
        g++-powerpc64-linux-gnu \
        g++-powerpc64le-linux-gnu \
        g++-riscv64-linux-gnu \
        g++-s390x-linux-gnu \
        g++-sparc64-linux-gnu
