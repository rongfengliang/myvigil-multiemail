FROM debian:stretch

WORKDIR /usr/src/vigil

COPY ./res/assets/ ./res/assets/
COPY target/release/vigil /usr/local/bin/vigil

RUN apt-get update
RUN apt-get install -y libstrophe-dev libssl-dev
# RUN ln -s /lib/x86_64-linux-gnu/libssl.so.1.1 /usr/lib/libssl.so.10
# RUN ln -s /lib/x86_64-linux-gnu/libcrypto.so.1.1 /usr/lib/libcrypto.so.10
CMD [ "vigil", "-c", "/etc/vigil.cfg" ]

EXPOSE 8080
