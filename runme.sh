#!/bin/bash

OS=`uname`
PD_SETTINGS="-path ../cvs/:../cvs/gridflow/abstractions/"

if [ $OS != Linux ]; then
    echo -e "You wish! This script is for Linux and especially for Michal's \
            environment. Meybe adapt it or talk to Michal (mis@artengine.ca).\n\
            No support for $OS!\n"
            exit 65
else
    echo -e "Starting pure data with the following settings: $PD_SETTINGS \n"
    pdextended $PD_SETTINGS okta.pd &
fi
