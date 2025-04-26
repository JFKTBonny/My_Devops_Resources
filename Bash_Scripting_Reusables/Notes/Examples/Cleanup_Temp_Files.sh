#!/bin/bash
set -euo pipefail

cleanup_temp_files() {
    local dirs=("$@")

    for dir in "${dirs[@]}"; do
        echo "Cleaning up temporary files in $dir..."
        # Simulate cleanup (uncomment the next line)
        # rm -rf "$dir"/tmp/*
    done
}

temp_dirs=(/tmp/user1 /tmp/user2 /tmp/user3)

cleanup_temp_files "${temp_dirs[@]}"