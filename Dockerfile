FROM debian:bookworm as tmp

RUN apt update -y && apt-get install -y wget

ARG REMOTE_FILE=paper-1.20.6-148.jar
ENV SERVER_FILENAME server.jar

RUN wget https://api.papermc.io/v2/projects/paper/versions/1.20.6/builds/148/downloads/${REMOTE_FILE}
RUN mv ${REMOTE_FILE} ${SERVER_FILENAME}

FROM openjdk:21

WORKDIR /app

ENV SERVER_FILENAME server.jar

ENV MIN_MEMORY 1096M
ENV MAX_MEMORY 1096M

COPY --from=tmp ${SERVER_FILENAME} .

COPY ./run_server.sh .

RUN chmod +x ./run_server.sh

ENTRYPOINT ["./run_server.sh"]