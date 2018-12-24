FROM library/debian:buster
RUN apt-get update && \
    apt-get install -y \
        gcc-powerpc-linux-gnu \
        gcc-powerpc-linux-gnuspe \
        gcc-powerpc64-linux-gnu \
        gcc-powerpc64le-linux-gnu
