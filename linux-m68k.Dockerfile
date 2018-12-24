FROM library/debian:buster
RUN apt-get update && \
    apt-get install -y gcc-m68k-linux-gnu
