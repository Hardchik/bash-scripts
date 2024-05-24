#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 log_file"
    exit 1
fi

log_file=$1

# Extract and count IP addresses
awk '{print $1}' "$log_file" | sort | uniq -c | sort -nr | head -n 10