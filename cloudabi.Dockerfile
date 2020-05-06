FROM library/debian:buster
COPY setup-cloudabi /tmp
RUN bash /tmp/setup-cloudabi && \
    rm /tmp/setup-cloudabi
