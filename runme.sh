#!/bin/bash

OS=`uname`
PD_SETTINGS="-path ../cvs/:../cvs/gridflow/abstractions/"

if [ $OS != Linux ]; then
    echo -e "Running on $OS, keep your fingers crossed!\n"
    open okta.pd
else
    echo -e "Starting pure data with the following, non-standard settings: $PD_SETTINGS \n"
    pdextended $PD_SETTINGS okta.pd &
fi
