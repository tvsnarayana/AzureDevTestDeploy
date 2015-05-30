FROM ubuntu

RUN apt-get update
RUN apt-get install -qy git
RUN apt-get install -qy curl
RUN apt-get install -qy emacs

WORKDIR project