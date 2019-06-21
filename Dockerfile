FROM rust:latest as build

RUN USER=root cargo new --bin personal-webserver
WORKDIR /personal-webserver

COPY config/rust-toolchain Cargo.lock Cargo.toml ./
RUN cargo build --release && \
  rm src/*.rs && \
  rm ./target/release/deps/personal_webserver*

COPY ./src ./src
COPY ./config/run ./
RUN cargo build --release

FROM debian:8-slim as run

COPY --from=build /personal-webserver/run ./
COPY --from=build /personal-webserver/target/release/personal-webserver ./target/release/personal-webserver

COPY ./static ./static

CMD "./run"