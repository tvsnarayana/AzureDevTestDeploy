tmux kill-session -t azurecon-demo1
docker stop $(docker ps -aq)
docker rm $(docker ps -qa) 
docker rmi $(docker images –q)
mux azurecon-demo1
