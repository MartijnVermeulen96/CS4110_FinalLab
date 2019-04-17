#!/bin/bash

i=$1
timeout=$2
printf '.\n '$i'\n y\n' | timeout $timeout java -jar RERSLearning.jar
