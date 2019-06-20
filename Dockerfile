FROM rust:latest

WORKDIR ./
COPY . .

RUN rustup self update \
  && rustup toolchain uninstall nightly \
  && rustup toolchain install nightly \
  && rustup default nightly

RUN cargo install --path .

CMD ["personal-webserver"]