#!/bin/bash

log_file=~/command_log.txt

# Log the command, start time, and end time with memory and disk usage
log_command() {
    local command="$@"
    local start_time=$(date '+%Y-%m-%d %H:%M:%S')
    {
        echo "Time: $start_time"
        echo "Command: $command"
        /usr/bin/time -v bash -c "$command"
        local end_time=$(date '+%Y-%m-%d %H:%M:%S')
        echo "End Time: $end_time"
        echo "-----------------------"
    } | tee -a $log_file
}

# Log the command passed to this script
log_command "$@"
