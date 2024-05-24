#!/bin/bash

# Check if two files are provided as arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 file1 file2"
    exit 1
fi

file1=$1
file2=$2

# Read all words from each file into arrays
mapfile -t words1 < <(tr -s '[:space:]' '\n' < "$file1")
mapfile -t words2 < <(tr -s '[:space:]' '\n' < "$file2")

# Get the length of the longer array
len1=${#words1[@]}
len2=${#words2[@]}
maxlen=$(( len1 > len2 ? len1 : len2 ))

# Flag to check if files are the same
same=1

# Compare words
for (( i=0; i<maxlen; i++ )); do
    word1="${words1[i]}"
    word2="${words2[i]}"

    if [ "$word1" != "$word2" ]; then
        echo "Word $((i+1)) is different: '$word1' vs '$word2'"
        same=0
    fi
done

if [ $same -eq 1 ]; then
    echo "The two files are the same."
fi