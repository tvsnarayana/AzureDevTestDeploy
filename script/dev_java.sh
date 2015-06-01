###########################################
# Build and deploy the Dev Java application
#
# If docker-machine is present assume that
# docker-machine is managing the docker
# hosts and us that. Otherwise use the same
# machine that this script is running on.
###########################################

source script/config.sh

echo "Staging Java application dev on $DEV_MACHINE_NAME"
eval "$(docker-machine env $DEV_MACHINE_NAME)"

cd java

# Build the container to ensure we pick up any changes
docker build -t javaApp:latest

# Stop, remove and restart the container
echo "Stopping any running dev container"
docker stop dev_java
echo "Removing any previously started dev container"
docker rm dev_java
echo "Running a dev container"
docker run -t -d -p 5555:8080 --name=dev_java javaApp:latest

cd ..
