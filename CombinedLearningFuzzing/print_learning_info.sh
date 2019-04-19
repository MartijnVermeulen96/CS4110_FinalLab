#!/bin/bash
> tempFile.txt
echo "Analyzing every Problem*/model.dot"

for i in $( ls -d Problem* ); do
  grep -o "ERROR [0-9]*" ./$i/learnedModel.dot | sort | uniq >> $i/learning_errors.txt
grep -o "s[0-9]* -> s[0-9]*" ./$i/learnedModel.dot | sort | uniq >> $i/learning_paths.txt
grep -o "s[0-9]*" ./$i/learnedModel.dot | sort | uniq >> $i/learning_states.txt

done
