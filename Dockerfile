FROM ubuntu

RUN apt-get update
RUN apt-get install -qy curl

WORKDIR project