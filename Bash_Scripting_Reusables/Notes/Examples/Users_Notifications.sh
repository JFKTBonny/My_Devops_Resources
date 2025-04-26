#!/bin/bash
set -euo pipefail

send_notifications() {
    local users=("$@")

    for user in "${users[@]}"; do
        echo "Sending notification to $user..."
        # Simulate sending notification (uncomment the next line)
        # send_notification_command "$user"
    done
}

users_to_notify=(user1@example.com user2@example.com user3@example.com)

send_notifications "${users_to_notify[@]}"