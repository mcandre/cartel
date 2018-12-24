FROM ubuntu:disco
RUN apt-get update && \
    apt-get install -y \
        gcc-arm-linux-gnueabi \
        gcc-arm-linux-gnueabihf \
        gcc-arm-none-eabi \
        gcc-aarch64-linux-gnu
