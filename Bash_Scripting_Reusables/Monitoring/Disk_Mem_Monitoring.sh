#!/bin/bash
export LC_NUMERIC=C  # Fix decimal issues in printf/awk/math

# Thresholds
CPU_THRESHOLD=80
MEM_THRESHOLD=80

# Function to check CPU usage
check_cpu_usage() {
    CPU_IDLE=$(top -bn1 | awk '/Cpu\(s\)/ {print $8}')
    CPU_USAGE=$(awk "BEGIN {print 100 - $CPU_IDLE}")
    printf "CPU usage: %.2f%%\n" "$CPU_USAGE"

    if (( $(awk "BEGIN {print ($CPU_USAGE > $CPU_THRESHOLD)}") )); then
        echo "⚠️  Warning: CPU usage exceeds ${CPU_THRESHOLD}%"
    fi
}

# Function to check Memory usage
check_mem_usage() {
    read -r MEM_TOTAL MEM_USED <<< $(free | awk '/Mem:/ {print $2, $3}')
    MEM_USAGE=$(awk "BEGIN {print ($MEM_USED/$MEM_TOTAL) * 100}")
    printf "Memory usage: %.2f%%\n" "$MEM_USAGE"

    if (( $(awk "BEGIN {print ($MEM_USAGE > $MEM_THRESHOLD)}") )); then
        echo "⚠️  Warning: Memory usage exceeds ${MEM_THRESHOLD}%"
    fi
}

# Main execution
check_cpu_usage
check_mem_usage
