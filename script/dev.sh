###########################################
# Build and run the dev container
###########################################

source script/config.sh

echo "Creating Dev container on $DEV_MACHINE_NAME"
eval "$(docker-machine env $DEV_MACHINE_NAME)"

docker build -t dev:latest .

# Stop, remove and restart the container
echo "Stopping any running dev container"
docker stop dev
echo "Removing any previous dev container"
docker rm dev
echo "Running a dev container on $DEV_MACHINE_NAME"
docker run --privileged -td -e LOG=file -v //home/docker/project:/project --name=dev dev:latest
docker exec dev bash -ci script/dev_asp.sh
docker exec dev bash -ci script/dev_java.sh