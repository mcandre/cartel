FROM ubuntu:bionic
COPY setup-cloudabi.ubuntu.sh /tmp
RUN bash /tmp/setup-cloudabi.ubuntu.sh && \
    rm /tmp/setup-cloudabi.ubuntu.sh
