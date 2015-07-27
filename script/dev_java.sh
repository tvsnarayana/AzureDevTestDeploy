###########################################
# Build and deploy the Dev Java application
#
# If docker-machine is present assume that
# docker-machine is managing the docker
# hosts and use that. Otherwise use the
# local machine.
###########################################

source script/config.sh

echo "Staging Java application dev on $DEV_MACHINE_NAME"
eval "$(docker-machine env $DEV_MACHINE_NAME)"

cd java

# Build the container to ensure we pick up any changes
docker build -t rest:latest .

# Stop, remove and restart the container
echo "Stopping any running dev container"
docker stop dev_rest
echo "Removing any previously started dev container"
docker rm dev_rest
echo "Running a dev container"
docker run -t -d -p 5050:5050 --name=dev_rest rest:latest

cd ..
