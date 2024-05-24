Create bash scripts to analyze your `.bash_history` file to achieve the specified tasks. Here are the scripts for each requirement:

### 1. Count of Each Command Executed in the Bash History

Create a script named `count_commands.sh`:

```sh
#!/bin/bash

# Check if .bash_history file exists
if [ ! -f ~/.bash_history ]; then
    echo ".bash_history file not found!"
    exit 1
fi

# Count occurrences of each command
awk '{print $1}' ~/.bash_history | sort | uniq -c | sort -nr
```

Make the script executable:

```sh
chmod +x count_commands.sh
```

Run the script:

```sh
./count_commands.sh
```

### 2. Fetch Commands Run from a Particular Time or Date 'A' to Time or Date 'B'

Bash history typically doesn't store timestamps by default. To include timestamps, you need to set `HISTTIMEFORMAT` in your `.bashrc` file. Add the following line to your `.bashrc`:

```sh
export HISTTIMEFORMAT='%F %T '
```

Then, reload your `.bashrc`:

```sh
source ~/.bashrc
```

Create a script named `fetch_commands.sh`:

```sh
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
```

Make the script executable:

```sh
chmod +x fetch_commands.sh
```

Run the script:

```sh
./fetch_commands.sh '2024-05-24 08:00:00' '2024-05-24 12:00:00'
```

### 3. Memory and Disk Size Required by Commands During Execution in the Past

Bash history does not store information about memory usage or disk size for commands. To track this, you would need to log this information separately. Below is a method using a custom logging script that wraps command execution.

Create a script named `log_command.sh`:

```sh
#!/bin/bash

log_file=~/command_log.txt

# Log the command, start time, and end time with memory and disk usage
log_command() {
    local command=$@
    local start_time=$(date '+%Y-%m-%d %H:%M:%S')
    /usr/bin/time -f "Time: $start_time\nCommand: $command\nMemory: %M KB\nDisk: %I KB in\n" -a -o $log_file bash -c "$command"
    local end_time=$(date '+%Y-%m-%d %H:%M:%S')
    echo "End Time: $end_time" >> $log_file
    echo "-----------------------" >> $log_file
}

# Log the command passed to this script
log_command "$@"
```

Make the script executable:

```sh
chmod +x log_command.sh
```

To use this script, prepend it to the command you want to log:

```sh
./log_command.sh ls -l
```

You can analyze the log file `~/command_log.txt` for memory and disk usage information.

### Summary

By using these scripts, you can analyze your bash history to count commands, fetch commands executed within a specific time frame, and log memory and disk usage for commands. Note that tracking memory and disk usage requires proactive logging, as this information is not stored in the default bash history.
