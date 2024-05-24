#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 file1 file2"
    exit 1
fi

file1=$1
file2=$2

# Compare files line by line
diff -u "$file1" "$file2" > diff_output.txt

if [ $? -eq 0 ]; then
    echo "The two files are the same."
else
    echo "The files have differences:"
    cat diff_output.txt
fi