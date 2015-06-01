####################################################################
# Build and Stage all components
#
# If docker-machine is present assume that
# docker-machine is managing the docker
# hosts and us that. Otherwise use the same
# machine that this script is running on.
####################################################################

echo '####################################################################'
echo '# Build and Stage ASP Application'
echo '####################################################################'

script/stage_asp.sh

echo '####################################################################'
echo '# Build and Stage Java REST API'
echo '####################################################################'

script/stage_java.sh