### Fuzzing with AFL
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


