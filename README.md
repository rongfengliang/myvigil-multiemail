Vigil
=====

> fork from https://github.com/valeriansaliou/vigil and add some new features

## some changes

because rustlang break changes for build with specific version of nightly

```code
FROM rustlang/rust:nightly AS build

USER root

WORKDIR /app

COPY . /app

RUN rustup install nightly-2019-01-17

RUN rustup   default nightly-2019-01-17-x86_64-unknown-linux-gnu

RUN cargo -V

RUN cargo build --release
```

## docker images

```code
docker push dalongrong/vigil
```

## added  features

* multi email send

multi email will split with `,`

config:

```code
[notify.email]

from = "status@crisp.chat"
to = "status@crisp.chat,status2@crisp.chat,status@crisp.chat"
```

## will adding features

* webhook integration
