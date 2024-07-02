FROM alpine:3.20.1
LABEL org.opencontainers.image.authors="matteo@gmail.com"

WORKDIR /server

ENV MIN_MEMORY 1096M
ENV MAX_MEMORY 1096M
ENV SERVER_FILENAME server.jar

RUN apk add --no-cache openjdk21 bash

COPY entrypoint.sh .
COPY server.jar .

ENTRYPOINT ["./entrypoint.sh"]
