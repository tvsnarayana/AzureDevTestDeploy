###########################################
# Build and run the ASP.Net application
###########################################

# FIXME: We should have a dev machine to work on
eval "$(docker-machine env tutorialStage)"
docker-machine env tutorialStage

cd asp

# Build the container to ensure we pick up any changes
docker build -f dev-Dockerfile -t asp:latest .

# Stop, remove and restart the container
echo "Stopping any running dev container"
docker stop dev_asp
echo "Removing any previous dev container"
docker rm dev_asp
echo "Running a container"
docker run -t -d -p 5004:5004 --name=dev_asp asp:latest

docker logs dev_asp
