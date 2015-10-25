FROM jenkins

# Setup docker
USER root
RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo "deb http://apt.dockerproject.org/repo debian-jessie main" >> /etc/apt/sources.list.d/docker.list
RUN apt-get update
RUN apt-get install -y docker-engine
RUN gpasswd -a jenkins docker

# Install docker compose
RUN curl -L https://github.com/docker/compose/releases/download/1.5.0rc1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Restore user
USER jenkins

# Install plugins
COPY ./plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

# Import jenkins files
COPY ./jenkins_home /var/jenkins_home

# Declare environment variables
ENV DOCKER_HOST=unix:///var/run/docker.sock
