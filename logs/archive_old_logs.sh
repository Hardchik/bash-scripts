#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 log_directory days"
    exit 1
fi

log_directory=$1
days=$2

# Find and archive logs older than specified days
find "$log_directory" -type f -mtime +"$days" -exec tar -rvf archived_logs.tar {} \; -exec rm {} \;