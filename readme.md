This is a very simple demo application that is used to show a web
client applicatoin and a Java application executing in Docker
containers. We also include a simple load testing container. 

The application is very simple, a web client application communicates
with a Java REST API and returns the information to the user.

This is not a real application. It doesn't do anything useful and it
isn't intended to do so. Neither is it a demonstration of best
practice application management. It is merely an introduction to using
containerized applications on Microsoft Azure.

# Getting Started #

See the docs folder for some getting started guides and a tutorial
deck that includes the essentials. If you are new to Docker then you
probably want to start there.

# Setup #

There are a few things you need to do to setup your environment, such
as installing docker clients and creating host machines on which to
deploy your containers. Take a look at the file environmentSetup.md
and come back here when you are done.

# Running the Application

The application is best run with Docker Compose:

```bash
docker-compose up -d
```

You can scale the web application up or down too:

```bash
docker-compose scale web=3
```

## Scripts 

The /script directory contains a number of helper scripts for managing
our build and development environments. Generally for starting up the 
application you should use Docker-Compose, the scripts in this 
directory are deprecated, there are, however, still useful for people 
learning about Docker and how it works because Docker Compose hides 
some details whereas the scripts show exactly what is happening.

Copy /scripts/config.tmpl to scripts/config.sh before using these
scripts. You might want to edit scripts/config.sh, see the file for
details.

The top level scripts, dev.sh and stage.sh, are the best place to
start, the first will deploy and load test the application on your dev
host while the second will deploy and load test the application on the
staging server.

# Load Balancer

We use an HA Proxy load balancer which dynamically discovers instances of the web application running on the same host.

# Web Application: Hello Web 

This is about as simple as a web application gets. 

This is a simple PHP application. That makes a call to the REST API
(see below) and provides a response. We start two instances of this
application and use a HAProxy load balancer to handle requests.

# Java Hello REST API #

Based on http://javahash.com/jersey-hello-world-example/

# Integration Testing

The integration_test container will do some simple integration
tests. It ensures that the PHP application gets a meaningful response
from the REST API.

# Load Testing #

While it might seem strange to load test a Hello World application
we've included a container that does just that! 

# Continuous Integration

The CI folder contains a CI configuration for the application.

Using the contents of this folder you can run a Jenkins based CI
server that will watch the GitHub project for changes. The workflow is
as follows:

  * Push change to GitHub
    * Integration tests are run
    * If integration tests pass, load_test is run
    * If load test passes integration_test project is promoted
  * When promoted integration_test will publish the web and rest artifacts to Docker Hub as adtd/web:dev

NOTE: in order for publication to work it is necessary to a) be a
member of the ADTD team on Docker Hub and b) to login to Docker Hub.

Anyone who has push access to the AzureDevTestDeploy project on GitHub
will be added to the ADTD team on Docker Hub. Once added you can login
on the Jenkins server using the following command:

`docker exec ci_jenkins_1 docker login --email="foo@bar.org" --username="foo" --password="bar"`
