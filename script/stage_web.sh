###########################################
# Build and run the web client application
#
# If docker-machine is present assume that
# docker-machine is managing the docker
# hosts and us that. Otherwise use the same
# machine that this script is running on.
###########################################

source script/config.sh

echo "Staging web client application version $WEB_STAGE_VERSION on $STAGE_MACHINE_NAME"
docker info

cd web

# Build the container to ensure we pick up any changes
docker build -t web:$WEB_STAGE_VERSION .

# Stop, remove and restart the container
echo "Stopping any running (staged) web application container"
docker stop stage_web
echo "Removing any previously (staged) web application container"
docker rm stage_web
echo "Running a container"
docker run -t -d -p 80:80 --link stage_rest:rest --name=stage_web web:$WEB_STAGE_VERSION

cd ..
