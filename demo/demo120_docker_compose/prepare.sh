tmux kill-session -t azurecon-demo3

docker stop $(docker ps -q)

docker-compose up -d
docker-compose scale web=1
docker-compose stop
docker-compose rm -f

mux azurecon-demo3
