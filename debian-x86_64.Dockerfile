FROM library/debian:buster
RUN apt-get update && \
    apt-get install -y g++-multilib
