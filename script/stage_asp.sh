###########################################
# Build and run the ASP.Net application
###########################################

source script/config.sh

echo "Staging verion $STAGE_VERSION"

eval "$(docker-machine env tutorialStage)"
docker-machine env tutorialStage

cd asp

# Build the container to ensure we pick up any changes
docker build -f stage-Dockerfile -t asp:$STAGE_VERSION .

# Stop, remove and restart the container
echo "Stopping any running staged container"
docker stop stage_asp
echo "Removing any previously staged container"
docker rm stage_asp
echo "Running a container"
docker run -t -d -p 80:5001 --name=stage_asp asp:$STAGE_VERSION

docker logs stage_asp
