#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 log_file"
    exit 1
fi

log_file=$1

# Check for common error patterns
grep -i 'error\|fail\|critical' "$log_file"