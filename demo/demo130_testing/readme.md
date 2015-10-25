# Objectives

1. See how tests can be provided in a separate container
2. Tests are run whenever `docker-compose up` is executed

---

# Starting the demo

  * `sudo ./demo/demo130_testing/prepare.sh`
  * On startup we will have 4 containers
    * Web application
    * Rest application
    * Load Balancer (for Web application)
    * Load Test
  * Load Test is the one we are interested in

---

# Benchmark Web Container

  * Uses Apache HTTP server benchmarking tool
  * `docker logs azuredevtestdeploy_load_test1`
    * Note the number of requests per second

# Scale the web cluster

  * `docker-compose scale web=25`
  * `docker-compose up -d` (restarts the load test container)
  * `docker logs azuredevtestdeploy_load_test1`
    * Note the number of requests per second, it's higher right?
    * It's more right?