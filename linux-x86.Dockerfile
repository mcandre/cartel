FROM ubuntu:disco
RUN apt-get update && \
    apt-get install -y gcc-multilib
