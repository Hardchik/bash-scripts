#!/bin/bash

# Check if two files are provided as arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 file1 file2"
    exit 1
fi

file1=$1
file2=$2

# Read the first word from each file
word1=$(head -n 1 "$file1" | awk '{print $1}')
word2=$(head -n 1 "$file2" | awk '{print $1}')

# Compare the words
if [ "$word1" == "$word2" ]; then
    echo "The words are the same: $word1"
else
    echo "The words are different: $word1 and $word2"
fi