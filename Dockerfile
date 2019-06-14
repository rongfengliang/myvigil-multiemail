FROM debian:stretch

WORKDIR /usr/src/vigil

COPY ./res/assets/ ./res/assets/
COPY target/release/vigil /usr/local/bin/vigil

RUN apt-get update
RUN apt-get install -y libstrophe-dev libssl-dev
RUN  cd /lib/x86_64-linux-gnu && ln -s libssl.so.1.1 libssl.so.10 \
      && ln -s libcrypto.so.1.1 libcrypto.so.10
CMD [ "vigil", "-c", "/etc/vigil.cfg" ]

EXPOSE 8080
