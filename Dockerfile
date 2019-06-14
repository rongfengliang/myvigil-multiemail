FROM debian:stretch-slim

WORKDIR /usr/src/vigil

COPY ./res/assets/ ./res/assets/
COPY target/release/vigil /usr/local/bin/vigil

RUN apt-get update
RUN apt-get install -y libssl libssl-dev

CMD [ "vigil", "-c", "/etc/vigil.cfg" ]

EXPOSE 8080
