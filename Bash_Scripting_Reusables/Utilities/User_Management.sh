#!/bin/bash
#  This script provides options to add, delete, list, and modify users.
# Check if the script is run with sufficient privileges
if [[ $EUID -ne 0 ]]; then
    echo "Please run this script with sudo or as root."
    exit 1
fi

# Function to add a user
add_user() {
    read -rp "Enter username to add: " username
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists."
    else
        useradd -m "$username" && echo "User '$username' added successfully." || echo "Failed to add user."
    fi
}

# Function to delete a user
delete_user() {
    read -rp "Enter username to delete: " username
    if id "$username" &>/dev/null; then
        read -rp "Are you sure you want to delete '$username'? [y/N]: " confirm
        if [[ $confirm =~ ^[Yy]$ ]]; then
            userdel "$username" && echo "User '$username' deleted." || echo "Failed to delete user."
        else
            echo "Deletion cancelled."
        fi
    else
        echo "User '$username' does not exist."
    fi
}

# Function to list users
list_users() {
    echo "System users:"
    awk -F: '$3 >= 1000 && $1 != "nobody" { print $1 }' /etc/passwd
}

# Function to modify a user
modify_user() {
    read -rp "Enter username to modify: " username
    if ! id "$username" &>/dev/null; then
        echo "User '$username' does not exist."
        return
    fi

    echo "Options:"
    echo "1) Change password"
    echo "2) Change home directory"
    read -rp "Select an option [1-2]: " option

    case $option in
        1)
            passwd "$username"
            ;;
        2)
            read -rp "Enter new home directory: " new_home
            usermod -d "$new_home" -m "$username" && echo "Home changed to '$new_home'." || echo "Failed to change home."
            ;;
        *)
            echo "Invalid option."
            ;;
    esac
}

# Main menu
while true; do
    echo
    echo "=== User Management Menu ==="
    echo "1) Add User"
    echo "2) Delete User"
    echo "3) List Users"
    echo "4) Modify User"
    echo "5) Exit"
    read -rp "Choose an option [1-5]: " choice

    case $choice in
        1) add_user ;;
        2) delete_user ;;
        3) list_users ;;
        4) modify_user ;;
        5) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid choice. Try again." ;;
    esac
done

# Privilege check (EUID): Warns if script isn’t run as root.

# Error handling: Checks if user exists before adding/deleting/modifying.

# Safety: Prompts for confirmation before deletion.

# User listing: Filters to only list real users (UID >= 1000, excluding nobody).

# Input prompts: More consistent and safer (read -rp).

# Home dir changes: Uses -m to move contents to the new home directory.

