#!/bin/bash

echo 'Now copying all fuzzing results from ../Fuzzing/ to this folder'

for i in $( ls -d Problem* ); do
	cp ../Fuzzing/$i/findings/ $i/findings/ -r
done
