#################################################################################
# Creates a Swarm for staging
#################################################################################

source script/config.sh

echo "Pulling Swarm container for use on the dev " $DEV_MACHINE_NAME
eval "$(docker-machine env $DEV_MACHINE_NAME)"
docker pull swarm

echo "Creating a Swarm cluster, using Docker Hub as the registry"
sid=$(docker run swarm create)
echo "Swarm cluster ID is " $sid

echo "Creating Swarm Master as ${STAGE_MACHINE_NAME}-master" 
docker-machine create -d azure --azure-location="$AZURE_LOCATION" --azure-subscription-id="$AZURE_SUBSCRIPTION_ID" --azure-subscription-cert="$AZURE_CERT_NAME" --swarm --swarm-master --swarm-discovery token://$sid  ${STAGE_MACHINE_NAME}-master

echo "Creating a Swarm nodes named ${STAGE_MACHINE_NAME}-node-01"      
docker-machine create -d azure --azure-location="$AZURE_LOCATION" --azure-subscription-id="$AZURE_SUBSCRIPTION_ID" --azure-subscription-cert="$AZURE_CERT_NAME" --swarm --swarm-discovery token://$sid ${STAGE_MACHINE_NAME}-node-01

echo "Creating a Swarm nodes named ${STAGE_MACHINE_NAME}-node-02"      
docker-machine create -d azure --azure-location="$AZURE_LOCATION" --azure-subscription-id="$AZURE_SUBSCRIPTION_ID" --azure-subscription-cert="$AZURE_CERT_NAME" --swarm --swarm-discovery token://$sid ${STAGE_MACHINE_NAME}-node-02
