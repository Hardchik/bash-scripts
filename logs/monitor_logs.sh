#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 log_file pattern"
    exit 1
fi

log_file=$1
pattern=$2

# Tail and grep for real-time monitoring
tail -f "$log_file" | grep --line-buffered "$pattern"