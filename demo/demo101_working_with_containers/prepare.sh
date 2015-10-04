tmux kill-session -t azurecon-demo1

export DOCKER_HOME=
export DOCKER=
docker stop $(docker ps -aq)
docker rm $(docker ps -qa) 
docker rmi -f hello-world
docker rmi -f tutum/hello-world
mux azurecon-demo1
