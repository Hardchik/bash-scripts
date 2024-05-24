#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 log_file date"
    exit 1
fi

log_file=$1
date=$2

# Extract logs for the specified date
grep "^$date" "$log_file"