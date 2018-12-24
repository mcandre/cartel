FROM library/debian:buster
RUN apt-get update && \
    apt-get install -y gcc-s390x-linux-gnu
