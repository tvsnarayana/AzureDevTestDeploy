#!/bin/sh

# Demo parameters
DEMO_NAME=acs-demo140

# Demo script location
SCRIPT_PATH=$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")
DEMO_HOME=$(dirname $SCRIPT_PATH)

# Configure TMux and Tmuxinator
mkdir ~/.tmuxinator
cp $DEMO_HOME/.tmuxinator/* ~/.tmuxinator

# Configure Docker
export DOCKER_HOME=
export DOCKER=

# Prepare Docker
cd ci
docker-compose stop

# Start Docker containers
docker stop $(docker ps -q)

cd ci
docker-compose up -d

# Create tmux session
#tmux kill-session -t $DEMO_NAME
#mux $DEMO_NAME
