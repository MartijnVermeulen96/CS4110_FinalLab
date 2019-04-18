# Fuzzing with AFL
In this folder, basic fuzzing can be executed.
Make sure a version of afl-fuzz is installed and can be run.
[AFL](http://lcamtuf.coredump.cx/afl/)


## Prepare the problems
Drop the RERS problems in this folder.
Run:
	
	python FuzzingProblems.py

To prepare the code for fuzzing.

## Compile the code
Compile all the problems in the folder using:

	bash afl_g++compile.sh

## Run the fuzzer
Simply run the fuzzer by executing:
	
	bash start_fuzzing.sh [Problem number] [Timeout]


## Run the batch
It is also possible to do the problems 1-9 & 11-19 in batches of maximum 7 processes, so that AFL can utilize the CPUs without interference.
	
	bash batch_execute.sh


