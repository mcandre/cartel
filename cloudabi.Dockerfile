FROM library/debian:buster
COPY setup-cloudabi.debian.sh /tmp
RUN bash /tmp/setup-cloudabi.debian.sh && \
    rm /tmp/setup-cloudabi.debian.sh
