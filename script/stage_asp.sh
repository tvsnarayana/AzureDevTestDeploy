###########################################
# Build and run the ASP.Net application
###########################################
eval "$(docker-machine env tutorialStage)"
docker-machine env tutorialStage

cd asp

# Build the container to ensure we pick up any changes
docker build -t asp:latest .

# Stop, remove and restart the container
echo "Stopping any running staged container"
docker stop stage_asp
echo "Removing any previously staged container"
docker rm stage_asp
echo "Running a container"
docker run -t -d -p 80:5001 --name=stage_asp asp

docker logs stage_asp
