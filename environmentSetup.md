# Environment Setup #

The purpose of this project is to demonstrate how you might configure a
development, test and deployment scenario on your workstation and on Azure 
using Docker. You will need setup one or more Docker hosts and thus you'll
need to setup some base tooling.

## Windows Pre-Requisites ##

Windows users should install Git for Windows from http://msysgit.github.io/.

This will provide both Git and a Bash shell. We will use the Bash shell as a
convenience since the scripts we have built are Bash scripts.

## Install Docker and Docker Machine ##

We will use Docker Machine to create our Docker Hosts. 

On Windows open a Bash shell (search for "Unix Bash" after installing Git
for Windows):

$ curl -L https://get.docker.com/builds/Windows/x86_64/docker-latest.exe > /bin/docker
$ curl -L https://github.com/docker/machine/releases/download/v0.2.0/docker-machine_windows-amd64.exe > /bin/docker-machine

See the Docker website for instructions on installing Docker and Docker 
Machine on other platforms see: http://docs.docker.com/machine/

### Configure Docker Machine ##

Docker Machine needs to have access to your Azure subscription. If you don't
already have an Azure subscription you can get a free trial at 
http://azure.microsoft.com/en-us/pricing/free-trial/

Once you have an active subscription run the following commands in a bash shell:

$ openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem
$ openssl pkcs12 -export -out mycert.pfx -in mycert.pem -name "My Certificate"
$ openssl x509 -inform pem -in mycert.pem -outform der -out mycert.cer

Now you need to go to the Azure portal (https://portal.azure.com). In the "Settings" 
section select "Management Certificates" and upload mycert.cer.

Grab your subscription ID from the portal, then run docker-machine create with these details:
$ docker-machine create -d azure --azure-subscription-id="SUB_ID" --azure-subscription-cert="mycert.pem" A-VERY-UNIQUE-NAME

## Create Docker Hosts ##

As a minimum you will need a Docker host for development. If you want to
push the application to a staging server for testing before production you
will need a host to act as your staging server. This could be the same host
as your development machine since this is not a real application. You may
also want to create a Docker host to act as your "production" server. Again,
since this is just an example project you could use the same machine as your
development machine.

The names of the Docker hosts are set in the script/config.sh file. By default
these are tutorialDev, tutorialStage and tutorialProd. If you want to use just
one or two Docker hosts, or you want to use different names for your machines
edit the values in script/config.sh. The default values are:

    - Dev machine: tutorialDev
    - Staging machine: tutorialStage
    - Production machine: tutorialProd

Run the following command for each machine you want to create. Be sure to
change AZURE_SUBSCRIPTION_ID to your subscription ID retrieved from the portal
and the MACHINE_NAME with the name you set in script/config.sh.

$ docker-machine create -d azure --azure-location="Central US" --azure-subscription-id="AZURE_SUBSCRIPTION_ID" --azure-subscription-cert="mycert.pem" MACHINE_NAME

Repeat this command for each of the machines you want to use.

## Open Ports on Docker Machines ##

It is necessary to open the appropriate ports on your Docker hosts to allow 
access to the applications. At a minimum you need to open the following ports
for the ASP.Net application:

    - port 80 on the production machine
    - port 8080 on the staging machine
    - port 8888 on the dev machine
  
  Note we use a different port for each role to allow a single host to act as
  all three machines. In a real project you would likely have separate machines
  for each of these roles and thus we would likely use the same port.
  
  You may also want to open the port for the Java application as follows:
  
    - port 5000 on the production machine
	  - port 5050 on the staging machine
	  - port 5555 on the dev machine