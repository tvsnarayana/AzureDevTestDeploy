# Objectives

1. Demonstrate how we can use Jenkins to do continuous integrationt testing

---

# Starting the demo

  * `sudo ./demo/demo140_continuos_integration/prepare.sh`
  * On startup we will have a number of containers
    * Web application
    * Rest application
    * Load Balancer (for Web application)
    * Load Test
    * Integration Test
    * Jenkins
  * The TMux session will have two windows available, one showing test results
  * The Jenkins container is the one we are interested in

---

# Viwe the Jenkins instance

```
http://YOURHOST:8081
```

---

# Trigger a build