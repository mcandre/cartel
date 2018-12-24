FROM library/ubuntu:disco
RUN apt-get update && \
    apt-get install -y \
        gcc-mips-linux-gnu \
        gcc-mipsel-linux-gnu \
        gcc-mips64-linux-gnuabi64 \
        gcc-mips64el-linux-gnuabi64
