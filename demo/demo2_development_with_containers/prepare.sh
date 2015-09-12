tmux kill-session -t azurecon-demo2
docker stop $(docker ps -aq)
./script/dev.sh
mux azurecon-demo2
