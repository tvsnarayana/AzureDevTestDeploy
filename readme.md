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

Development is supported by a pre-configured development container.
See the environemntSetup.md file for more information on how to 
configure your development docker machine. 

In the root directory of the project there is a Dockerfile which defines
a preconfigured development environment. To build and run the development 
container run:

$ script/dev.sh

You will now be in a shell inside the development container. To 
exit the machine and return to your host simply run the command 'exit'.

This container is configured to allow you to run Docker inside of it.
You can therefore run the application containers inside this container
on your local machine. This is useful because the development container
can watch for changes in your source files, rebuild the container and
run simple tests automatically.

If you run 'ls -l' you will see that you are in a directory that is mapped
into the source directory on your host machine. You can safely make changes
in either the host or the dev container and see them reflected in both 
locations.

--- FIXME: start containers in dev mode when the dev container is started

The development container will watch for changes in your configuration files and 
rebuild/restart development versions of your application containers whenever
necessary. See the readme.md file for more information.


## A Note on Debugging ##

If deploying your containers fails for some reason it can sometimes be
difficult finding out why. So here's a couple of useful tips:

You can view the logs of the container with "docker logs MACHINE_NAME"

If things don't work as expected you can connect to a running container 
with "docker exec -it MACHINE_NAME bash". Once connected you can work
inspect the machine directly.

# Staging #

To build and stage the ASP.Net application run script/stage_asp.sh.

To build and stage the Java application run script/stage_java.sh

For convenience you can build and stage all components at the same time
using 'script/stage.sh'

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
