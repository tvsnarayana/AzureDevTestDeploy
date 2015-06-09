# There is currently (5/31/2015) a bug in docker-machine/boot2docker that
# means shared folders do not work as expected. To work around this
# bug run the following script (after editing the last line) each time you 
# provsiion a hyper-v docker-machine.

source script/config.sh

read -s -p "What is the password for the user account '$USER_NAME'?" USER_PASSWORD

echo
echo "Configuring $DEV_MACHINE_NAME"

docker-machine ssh $DEV_MACHINE_NAME wget http://distro.ibiblio.org/tinycorelinux/5.x/x86/tcz/cifs-utils.tcz
docker-machine ssh $DEV_MACHINE_NAME -- tce-load -i cifs-utils.tcz
docker-machine ssh $DEV_MACHINE_NAME mkdir project
echo "Mounting //$CLIENT_IP/$CLIENT_PATH_TO_PROJECT as /home/docker/project"
docker-machine ssh $DEV_MACHINE_NAME -- "sudo mount -t cifs //$CLIENT_IP/$CLIENT_PATH_TO_PROJECT /home/docker/project -o user=$USER_NAME,password=$USER_PASSWORD"
