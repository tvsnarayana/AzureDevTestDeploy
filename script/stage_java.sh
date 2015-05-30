###########################################
# Build and stage the Java application
###########################################

source script/config.sh

echo "Staging Java application version $JAVA_STAGE_VERSION on $STAGE_MACHINE_NAME"
eval "$(docker-machine env $STAGE_MACHINE_NAME)"

cd java

# Build the container to ensure we pick up any changes
docker build -t java:$JAVA_STAGE_VERSION .

# Stop, remove and restart the container
echo "Stopping any running staged container"
docker stop stage_java
echo "Removing any previously staged container"
docker rm stage_java
echo "Running a container"
docker run -t -d -p 5050:8080 --name=stage_java java:$JAVA_STAGE_VERSION
