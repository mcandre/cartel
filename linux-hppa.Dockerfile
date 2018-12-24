FROM library/debian:experimental
RUN apt-get update && \
    apt-get install -y \
        gcc-hppa-linux-gnu \
        gcc-hppa64-linux-gnu
