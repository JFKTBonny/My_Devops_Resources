#!/bin/bash
set -euo pipefail

process_files() {
    local files=("$@")

    for file in "${files[@]}"; do
        echo "Processing $file..."
        # Simulate processing (uncomment the next line)
        # cat "$file"
    done
}

files_to_process=(file1.txt file2.txt file3.txt)

process_files "${files_to_process[@]}"