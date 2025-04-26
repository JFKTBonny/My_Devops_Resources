#!/bin/bash
set -euo pipefail
set -x  # Debug mode: print each command before executing

# Display top 10 processes by CPU usage (optional)
# echo "Top 10 processes by CPU usage:"
# top -b -n 1 | head -n 17

# Check if htop is installed
if command -v htop &> /dev/null; then
    echo "Running htop..."
    htop
else
    echo "htop is not installed. Please install it to use this script."
fi

# List all active TCP and UDP listening ports
echo "Active connections and listening ports:"
sudo netstat -tuln

# Set the host to test
HOST="google.com"

echo "Pinging $HOST..."
ping -c 4 "$HOST"

echo "Tracing route to $HOST..."
traceroute "$HOST"

# Display disk space usage
echo "Disk space usage:"
df -h

# Display memory usage
echo "Memory usage:"
free -h

# Display recent kernel messages (limit output to avoid overload)
echo "Recent kernel messages:"
sudo dmesg | tail -n 20

# Display recent system logs
echo "Recent system logs:"
journalctl -n 50 --no-pager

# Display system uptime and load averages
echo "System Uptime and Load Averages:"
uptime

# Check if iftop is installed
if command -v iftop &> /dev/null; then
    echo "Running iftop for network bandwidth monitoring..."
    sudo iftop
else
    echo "iftop is not installed. Please install it to use this script."
fi

# View system log (syslog)
echo "Viewing system log (last 50 lines):"
sudo tail -n 50 /var/log/syslog

# List zombie processes
echo "Checking for zombie processes:"
ps aux | awk '$8 == "Z" { print $0 }'
