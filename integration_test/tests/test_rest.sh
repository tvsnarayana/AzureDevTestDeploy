#!/bin/bash

echo "Testing that the web UI shows a response from the REST API"

rest_hostname=$(curl -q http://web | egrep -c "<p>REST hostname is .+</p>")

if [ $rest_hostname -eq 1 ]
then echo "Tests Passed"
else >&2 echo "Tests Failed"
fi
