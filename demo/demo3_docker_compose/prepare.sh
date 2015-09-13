tmux kill-session -t azurecon-demo3

docker-compose up -d --force-recreate
docker-compose scale web=1
docker-compose stop

mux azurecon-demo3
