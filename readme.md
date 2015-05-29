This is a very simple demo application that is used to show an ASP.Net
applicatoin and a Java application executing in Docker containers. The
application is very simple, an ASP.Net web application communicates
with a Java REST API and returns the information to the user.

This is not a real application. It doesn't do anything useful and it
isn't intended to do so. Neither is it a demonstration of best
practice application management. It is merely an introduction to using
containerized applications on Microsoft Azure.

# Setup #

There are a few tihngs you need to do to setup your environment. Take
a look at the file environmentSetup.md and come back here when you are 
done.

# Development #

Clone the source from https://github.com/rgardler/AzureDevTestDeploy.

In the root directory of the project there is a Dockerfile which defines
a preconfigured development environment. This will use the source on your
host machine and thus you can use whichever development tools you want to
edit those files.

To build and run the development container run:

$ script/dev.sh

You will now be in a shell script inside the development container. To 
exit the machine and return to your host simply run the command 'exit'.

---- FIXME ----
Currently we can't mount a volume in Windows

If you run 'ls -l' you will see that you are in a directory that is mapped
into the source directory on your host machine.

## A Note on Debugging ##

If deploying your containers fails for some reason it can sometimes be
difficult finding out why. So here's a couple of useful tips:

You can view the logs of the container with "docker logs MACHINE_NAME"

If things don't work as expected you can connect to a running container 
with "docker exec -it MACHINE_NAME bash". Once connected you can work
inspect the machine directly.

# Staging #

To build and stage the ASP.Net application run script/stage_asp.sh. The variable

To build and stage the Java application run script/stage_java.sh

Once both applications are staged you can visit:
  * Java REST API: http://tutorialstage.cloudapp.net:5050/JerseyHelloWorld/rest/helloworld 
  * ASP Front-End: http://tutorialstage.cloudapp.net:8080

# Scripts #

The /script directory contains a number of helper scripts for managing
our build and development environments.

## Variables ##

Variables are used to configuring the various scripts.

STAGE_VERSION - the version number for the staged builds

# ASP.net Hello Web #

Based on the Hello world using Nancy framework. See https://github.com/NancyFx/Nancy/wiki/Introduction
Initial project created using Yeoman: npm install -g yo grunt-cli generator-aspnet bower; yo aspnet
This async tutorial was really useful too: http://blog.jonathanchannon.com/2013/08/24/async-route-handling-with-nancy/


# Java Hello REST API #

Based on http://javahash.com/jersey-hello-world-example/

# TODO

  * Make the Dev environment be a container host environment too (i.e. the dev should be a meta-host)
    * 
  * Create a single script to run both the Java and ASP applications
  * Create a configuration file for both the Java and ASP applications so we can see the difference between dev and prod
