#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 log_file max_size"
    exit 1
fi

log_file=$1
max_size=$2

# Rotate log if it exceeds max size
log_size=$(stat -c%s "$log_file")

if [ "$log_size" -ge "$max_size" ]; then
    mv "$log_file" "${log_file}.$(date +'%Y%m%d%H%M%S')"
    touch "$log_file"
    echo "Log file rotated: $log_file"
else
    echo "Log file size is within limits."
fi