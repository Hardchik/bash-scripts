#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 file1 file2"
    exit 1
fi

file1=$1
file2=$2

size1=$(stat -c%s "$file1")
size2=$(stat -c%s "$file2")

if [ "$size1" -eq "$size2" ]; then
    echo "The files have the same size."
else
    echo "The files have different sizes."
    echo "Size of $file1: $size1 bytes"
    echo "Size of $file2: $size2 bytes"
fi