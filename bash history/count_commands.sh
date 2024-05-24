#!/bin/bash

# Check if .bash_history file exists
if [ ! -f ~/.bash_history ]; then
    echo ".bash_history file not found!"
    exit 1
fi

# Count occurrences of each command
awk '{print $1}' ~/.bash_history | sort | uniq -c | sort -nr