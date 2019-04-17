#!/bin/bash

echo -n "Enter the problem number [ENTER]: "
read problem

echo -n "Use ttt or lstar? (input ttt/lstar [ENTER]): "
read learning

java -jar activelearner-0.1.0-SNAPSHOT.jar --spring.profiles.active=target-rers_$problem,$learning,afl,afleq

