#!/bin/bash
set -euo pipefail

# Function to install programs
install_programs() {
    local programs=("$@")  # Capture all arguments as an array

    for program in "${programs[@]}"; do
        echo "Installing $program..."
        # Simulate installation (replace with actual installation command)
        # sudo apt-get install -y "$program"
    done
}

# Define an array of programs to install
programs_to_install=(git curl vim)

# Call the function with the array
install_programs "${programs_to_install[@]}"


# Array Definition: programs_to_install is defined as an array containing the names of programs to install.

# Function Parameter: The function install_programs captures its arguments as an array using ("$@").

# Loop Through Array: The function loops through each program in the array and simulates an installation (you would replace the echo command with the actual installation command).

# Calling the Function: The function is called with the array elements expanded using "${programs_to_install[@]}".

