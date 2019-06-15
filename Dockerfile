FROM rustlang/rust:nightly AS build

USER root

WORKDIR /app

COPY . /app

RUN rustup install nightly-2019-01-17

RUN rustup   default nightly-2019-01-17-x86_64-unknown-linux-gnu

RUN cargo -V

RUN cargo build --release

FROM debian:stretch-slim

WORKDIR /usr/src/vigil

COPY ./res/assets/ ./res/assets/
COPY --from=build /app/target/release/vigil /usr/local/bin/vigil

COPY ./res/assets/ ./res/assets/

RUN apt-get update
RUN apt-get install -y libstrophe-dev libssl-dev

CMD [ "vigil", "-c", "/etc/vigil.cfg" ]

EXPOSE 8080
