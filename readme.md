This is a very simple demo application that is used to show a web client
applicatoin and a Java application executing in Docker containers. The
application is very simple, a web client application communicates
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

There are a few things you need to do to setup your environment. Take
a look at the file environmentSetup.md and come back here when you are 
done.

# Scripts #

The /script directory contains a number of helper scripts for managing
our build and development environments.

Copy /scripts/config.tmpl to scripts/config.sh before using these
scripts. You might want to edit scripts/config.sh, see the file for
details.

# Web Application: Hello Web #

This is about as simple as a web application gets. 

# Java Hello REST API #

Based on http://javahash.com/jersey-hello-world-example/

