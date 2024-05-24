#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 file1 file2"
    exit 1
fi

file1=$1
file2=$2

# Find unique lines in file1
echo "Unique lines in $file1:"
comm -23 <(sort "$file1") <(sort "$file2")

# Find unique lines in file2
echo "Unique lines in $file2:"
comm -13 <(sort "$file1") <(sort "$file2")