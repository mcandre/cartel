FROM library/debian:buster
RUN apt-get update && \
    apt-get install -y git cmake g++ python && \
    git clone https://github.com/juj/emsdk.git && \
    sh -c 'cd emsdk && ./emsdk install latest && ./emsdk activate latest' && \
    apt-get remove -y git cmake g++ && \
    apt-get autoremove -y
