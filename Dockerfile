FROM golang:1.14 as build

COPY ./ /personal-webserver

WORKDIR /personal-webserver

RUN make

FROM alpine:latest as run

COPY --from=build /personal-webserver/static /static
COPY --from=build /personal-webserver/bin/personal_webserverd /bin/personal_webserverd

ENV GIN_MODE "release"

CMD "personal_webserverd"

EXPOSE 80