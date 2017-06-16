#! /bin/bash

i=0
while [[ $i -lt $ITERATIONS ]]
do
 echo "helloworld:" $i
 i=$[$i+1]
done
