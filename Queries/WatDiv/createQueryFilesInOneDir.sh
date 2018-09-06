#!/bin/bash

# Author: Olaf Hartig http://olafhartig.de

if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"
    exit
fi

filename="$1"
outputdir="$2"

querycnt=0
while IFS='' read -r line || [[ -n "$line" ]]; do
    ((querycnt++))
    echo "$querycnt"
    echo "$line" > ${outputdir}/Q${querycnt}.rq
done < "$filename"