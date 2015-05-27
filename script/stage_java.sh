###########################################
# Build and stage the Java application
###########################################
eval "$(docker-machine env tutorialStage)"
docker-machine env tutorialStage

# Build the container to ensure we pick up any changes
docker build -t java .

# Stop, remove and restart the container
echo "Stopping any running staged container"
docker stop stage_java
echo "Removing any previously staged container"
docker rm stage_java
echo "Running a container"
docker run -t -d -p 8080:8080 --name=stage_java java
