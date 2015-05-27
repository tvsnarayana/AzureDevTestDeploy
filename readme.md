This is a very simple demo application that is used to show an ASP.Net
applicatoin and a Java application executing in Docker containers. The
application is very simple, an ASP.Net web application communicates
with a Java REST API and returns the information to the user.

This is not a real application. It doesn't do anything useful and it
isn't intended to do so. Neither is it a demonstration of best
practice application management. It is merely an introduction to using
containerized applications on Microsoft Azure.

# Scripts #

To build and deploy the ASP.Net application run script/stage_asp.sh

To build and deploy the Java application run script/stage_java.sh

# ASP.net Hello Web #

Based on code from the ASP.Net 1.0.0-beta4 samples at https://github.com/aspnet/Home/tree/dev/samples/1.0.0-beta4/HelloWeb

# Java Hello REST API #

Based on http://javahash.com/jersey-hello-world-example/
