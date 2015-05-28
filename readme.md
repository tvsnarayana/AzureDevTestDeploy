This is a very simple demo application that is used to show an ASP.Net
applicatoin and a Java application executing in Docker containers. The
application is very simple, an ASP.Net web application communicates
with a Java REST API and returns the information to the user.

This is not a real application. It doesn't do anything useful and it
isn't intended to do so. Neither is it a demonstration of best
practice application management. It is merely an introduction to using
containerized applications on Microsoft Azure.

# Scripts #

The /script directory contains a number of helper scripts for managing
our build and development environments.

## Variables ##

Variables are used to configuring the various scripts.

STAGE_VERSION - the version number for the staged builds

## Staging ##

To build and stage the ASP.Net application run script/stage_asp.sh. The variable

To build and stage the Java application run script/stage_java.sh

Once both applications are staged you can visit:
  * Java REST API: http://tutorialstage.cloudapp.net:8080/JerseyHelloWorld/rest/helloworld 
  * ASP Front-End: http://tutorialstage.cloudapp.net

# ASP.net Hello Web #

Based on the Hello world using Nancy framework. See https://github.com/NancyFx/Nancy/wiki/Introduction
Initial project created using Yeoman: npm install -g yo grunt-cli generator-aspnet bower; yo aspnet
This async tutorial was really useful too: http://blog.jonathanchannon.com/2013/08/24/async-route-handling-with-nancy/


# Java Hello REST API #

Based on http://javahash.com/jersey-hello-world-example/

# TODO

  * Make the Dev environment be a container host environment too (i.e. the dev should be a meta-host)
  * Create a single script to run both the Java and ASP applications
  * Create a configuration file for both the Java and ASP applications so we can see the difference between dev and prod
