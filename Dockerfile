FROM        ubuntu:20.04

LABEL       maintainer="guerra@develer.com"
LABEL       version="0.1"
LABEL       description="This is custom Docker Image for testing arduino-connector with docker and mosquitto."

ARG         DEBIAN_FRONTEND=noninteractive

RUN         apt update
RUN         apt install -y  \
            curl            \
            gcc             \
            mosquitto       \
            tzdata          \
            docker.io

RUN         curl -O https://dl.google.com/go/go1.15.2.linux-amd64.tar.gz
RUN         tar xvf go1.15.2.linux-amd64.tar.gz
RUN         mv go /usr/local

ENV         PATH=$PATH:/usr/local/go/bin

COPY        scripts .
COPY        config/daemon.json /etc/docker/daemon.json

WORKDIR     /home

ENTRYPOINT  "/start.sh"
