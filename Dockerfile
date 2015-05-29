FROM ubuntu

RUN apt-get update
RUN apt-get install -qy git

RUN mkdir /project
WORKDIR /project