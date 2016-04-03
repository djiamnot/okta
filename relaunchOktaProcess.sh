#!/bin/bash

PATH=$PATH:/usr/local/bin

# kill the Quicktime Broadcaster app (find its PID first)
QT=$(ps aux | grep Broadcaster | grep -v grep | awk '{print $2}')
if [ -n "$QT" ]; then
	echo "killing QTBroadcaster"
	kill -s SIGTERM $QT
else
	echo "QTBroadcaster not running so not killing"
fi

# kill the okta camera app (find its PID first)
OVID=$(ps aux | grep okta_2015 | grep -v grep | awk '{print $2}')
if [ -n "$OVID" ]; then
	echo "killing okta_2015"
	kill -s SIGTERM $OVID
else
	echo "okta_2015 not running so not killing anything"
fi

# kill the lunch process but we know its PID
if [ -f /var/tmp/lunch/master-okta-macoslunch.pid ]; then
	cat /var/tmp/lunch/master-okta-macoslunch.pid | xargs kill -s SIGTERM
fi

find /Users/okta/src/okta -iname ".DS_Store" | xargs rm

sleep 15
/Users/okta/src/okta/okta-macos.lunch &
