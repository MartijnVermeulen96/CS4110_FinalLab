#!/bin/bash
printf "Enter timeout (1d, 1m, 3h, etc..): "
read timeout

for i in $( ls -d Problem* ); do
	problem=$(printf $i'\n' |tr -dc '0-9')
	gnome-terminal -e "bash execute.sh $problem $timeout"
done 
