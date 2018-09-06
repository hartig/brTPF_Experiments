#!/bin/bash

# Author: Olaf Hartig http://olafhartig.de

if [ "$#" -ne 3 ]; then
    echo "Illegal number of parameters"
fi

filename="$1"
outputdir="$2"
number_of_subdirs="$3"

for (( c=1; c<=${number_of_subdirs}; c++ ))
do
   echo "Creating subdir $c"
   mkdir ${outputdir}/${c}
done

subdircnt=1
querycnt=0
while IFS='' read -r line || [[ -n "$line" ]]; do
    ((querycnt++))
    echo "$querycnt into $subdircnt"
    echo "$line" > ${outputdir}/${subdircnt}/Q${querycnt}.rq

    ((subdircnt++))
    if [ "$subdircnt" -gt "$number_of_subdirs" ];then
        subdircnt=1;
    fi
done < "$filename"