#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 log_file"
    exit 1
fi

log_file=$1

# Generate report
echo "Log Report for $log_file"
echo "======================"
echo "Total entries: $(wc -l < "$log_file")"
echo "Errors: $(grep -ci 'error\|fail\|critical' "$log_file")"
echo "Top IPs:"
awk '{print $1}' "$log_file" | sort | uniq -c | sort -nr | head -n 10
echo "Activity by hour:"
awk '{ print $1 " " $2 }' "$log_file" | cut -d: -f1 | uniq -c