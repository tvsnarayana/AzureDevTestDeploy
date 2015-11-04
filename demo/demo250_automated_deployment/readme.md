# Objectives

1. Demonstrate how we can use Jenkins for continuous integration
2. Demonstrate how we can use Jenkings for Continuous Delivey

---

# Setup

  * You will need:
    * A dev machine with:
      * Docker
      * Docker Compose
      * Checkout of this repo
        * https://github.com/rgardler/AzureDevTestDeploy.git
    * An ACS cluster
      * Until the service enters preview use https://github.com/anhowe/scratch/tree/master/mesos-marathon
    * A CI/CD container in that cluster (must have run docker login)
      * SSH into the Jumpbox in the cluster
      * cd ci
      * docker-compose up -d
      * docker exec -it ci_jenkins_1 bash
        * docker login
        * exit

--

# Dev Machine

This machine is used to show the dev workflow:

  * Run the application locally
  * Make some edits
  * Verify Changes
  * Push to version control

--

# Dev Machine Configuration
  * Docker
  * Docker Compose
  * Checkout of this repo
    * `git clone https://github.com/rgardler/AzureDevTestDeploy.git`

--

# Dev Machine Setup

  * Open a terminal
    * set to full screen
    * set font to a suitable size for the projector
  * demo/demo250_automated_deployment/prepare-dev.sh

--    

# Azure Container Service Cluster

ACS Cluster acts as a place to stage the latest build of the
application.

Used to verify the build before publication.

  * Prior to ACS preview use our development template
    * https://github.com/anhowe/scratch/tree/master/mesos-marathon
  * After ACS preview use the ACS REsource Provider
    * TODO: Update once ACS private preview is available

--

# CI/CD Machine

The CI/CD machine needs to be able to run commands on the ACS cluster.

The easiest way to do this is to use the Jumpbox provided as part of
ACS.

  * SSH into the Jumpbox in the cluster and run the following commands

```
git clone https://github.com/rgardler/AzureDevTestDeploy.git
cd AzureDevTestDeploy/ci
docker-compose up -d
docker exec -it ci_jenkins_1 bash
docker login
exit
```

---

# Demo Phase 1: Developer Workflow

In this phase of the demo we see the developer making a change to the
app, verifying it and pushing it to version control.

## Details

  * 

---

# View the demo application on the staging cluster

  * http://STAGING_HOST
  * A simple PHP web front-end with a Java Backend (REST API)
  * Front end is load balanced

---

# Make a change to the application (on the Dev machine)

  * `vi web/www/html/index.php`
    * Edit the first h1
  * `docker-compose -f docker-compose-dev.yml up -d`
    * Note how the web container is rebuilt and restarted
  * http://localhost
  * Looks good, lets push the changes so all devs have them
    * git commit -am "trigger a build for the MVP demo"

---

# Docker brings us easy scaling

  * `docker-compose scale web=3`
  * http://localhost (a few times)
  * Look how our load balancer is now working across the three web servers

## Details

This slide is not strictly necessary it's really only here to fill
time while the CI system runs in the background.

---

# About the Staging Cluster

  * Running on the dev machine can only take us so far
  * Need to run on a staging cluster
    * Test HA and more

---

# Introduction to Azure Container Service

  * A convenient way to create a cluster of Docker Hosts
  * Highliy available
  * Application Orchestration

---

# Deployment options

  * Portal
  * ARM

---

# ACS as a Staging Cluster

  * The default orchestrator
  * http://YOURCLUSTER:5050
  * Note how we have the application running in staging already
    * We'll look at how that happened in a moment
  * http://STAGING_HOST
    * See the change we made!

---

# How did that happen?

  * We have a CI/CD server in the cluster
  * http://YOUR_CI_CD:8081
  * It detected changes in GitHub
  * Built and tested the application
  * Published the updated containers to Docker Hub
    * With "stage" tag
  * Instructucted Azure Container Service to update the staged app


