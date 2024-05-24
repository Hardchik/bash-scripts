#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 file1 file2"
    exit 1
fi

file1=$1
file2=$2

# Count lines, words, and characters
count1=$(wc "$file1")
count2=$(wc "$file2")

echo "Counts for $file1:"
echo "$count1"

echo "Counts for $file2:"
echo "$count2"