FROM rust:1.32.0 AS build

WORKDIR /app

COPY . /app
RUN cargo build --release

FROM debian:stretch-slim

WORKDIR /usr/src/vigil

COPY ./res/assets/ ./res/assets/
COPY --from=build /app/target/release/vigil /usr/local/bin/vigil

RUN apt-get update
RUN apt-get install -y libssl-dev

CMD [ "vigil", "-c", "/etc/vigil.cfg" ]

EXPOSE 8080
