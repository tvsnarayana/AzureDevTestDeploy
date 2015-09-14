tmux kill-session -t azurecon-demo2
docker stop $(docker ps -aq)
./script/dev.sh
docker stop dev_load
mux azurecon-demo2
