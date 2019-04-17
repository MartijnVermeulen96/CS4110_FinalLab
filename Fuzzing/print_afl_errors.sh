#!/bin/bash
> tempFile.txt
echo Which problem folder?
read problemfolder
for f in $problemfolder/findings/crashes/id* ; do
  echo $f
  command="./$problemfolder/${problemfolder}_afl < $f"
  echo "$command"
  eval $command &>> tempFile.txt
  > $problemfolder/afl_errors.txt
  grep -o "error_[0-9]*" tempFile.txt | sort | uniq >> $problemfolder/afl_errors.txt
done
