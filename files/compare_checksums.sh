#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 file1 file2"
    exit 1
fi

file1=$1
file2=$2

# Generate and compare checksums
checksum1=$(md5sum "$file1" | awk '{print $1}')
checksum2=$(md5sum "$file2" | awk '{print $1}')

if [ "$checksum1" == "$checksum2" ]; then
    echo "The files are identical."
else
    echo "The files are different."
    echo "Checksum of $file1: $checksum1"
    echo "Checksum of $file2: $checksum2"
fi