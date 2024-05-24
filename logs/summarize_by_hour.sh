#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 log_file"
    exit 1
fi

log_file=$1

# Summarize log entries by hour
awk '{ print $1 " " $2 }' "$log_file" | cut -d: -f1 | uniq -c