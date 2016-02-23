#!/bin/bash

# kill the Quicktime Broadcaster app (find its PID first)
kill -s SIGTERM $(ps aux | grep Broadcaster | grep -v grep | awk '{print $2}')

# kill the okta camera app (find its PID first)
kill -s SIGTERM $(ps aux | grep okta_2015 | grep -v grep | awk '{print $2}')

# kill the lunch process but we know its PID
cat /var/tmp/lunch/master-okta-macoslunch.pid | xargs kill -s SIGTERM

sleep 15
./okta-macos.lunch &
