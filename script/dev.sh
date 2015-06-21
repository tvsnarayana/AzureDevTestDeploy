####################################################################
# Build and Run all components on Development Machine
#
# If docker-machine is present assume that
# docker-machine is managing the docker
# hosts and us that. Otherwise use the same
# machine that this script is running on.
####################################################################

echo '####################################################################'
echo '# Build and Run Java REST API'
echo '####################################################################'

script/dev_java.sh

echo '####################################################################'
echo '# Build and Stage ASP Application'
echo '####################################################################'

script/dev_asp.sh

