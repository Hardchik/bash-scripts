#!/bin/bash

# Check if correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 'YYYY-MM-DD HH:MM:SS' 'YYYY-MM-DD HH:MM:SS'"
    exit 1
fi

start_time=$1
end_time=$2

# Check if .bash_history file exists
if [ ! -f ~/.bash_history ]; then
    echo ".bash_history file not found!"
    exit 1
fi

# Check if history file contains timestamps
if ! grep -q '^[0-9]' ~/.bash_history; then
    echo ".bash_history does not contain timestamps. Please set HISTTIMEFORMAT in your .bashrc."
    exit 1
fi

# Fetch commands between the specified times
awk -v start="$start_time" -v end="$end_time" '
{
    if ($0 ~ /^[0-9]/) {
        timestamp = $0;
        getline;
        command = $0;
        if (timestamp >= start && timestamp <= end) {
            print timestamp, command;
        }
    }
}
' ~/.bash_history