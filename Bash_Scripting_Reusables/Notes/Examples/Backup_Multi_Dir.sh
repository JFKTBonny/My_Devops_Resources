#!/bin/bash
set -euo pipefail

backup_directories() {
    local directories=("$@")
    local backup_dest="/backup"

    for dir in "${directories[@]}"; do
        echo "Backing up $dir to $backup_dest..."
        # Simulate backup (uncomment the next line)
        # cp -r "$dir" "$backup_dest"
    done
}

dirs_to_backup=(/home/user/documents /home/user/pictures /home/user/music)

backup_directories "${dirs_to_backup[@]}"



