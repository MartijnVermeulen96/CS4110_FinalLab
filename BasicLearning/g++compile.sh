#!/bin/bash
for i in $( ls -d Problem* ); do
    g++ $i/$i.c -o $i/a.exe &
done
