FROM ubuntu:bionic
RUN apt-get update && \
    apt-get install -y gcc-multilib
