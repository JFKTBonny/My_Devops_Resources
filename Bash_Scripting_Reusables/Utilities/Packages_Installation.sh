#!/bin/bash

# Variables
PACKAGES=(git curl vim)

# Install packages
echo "Installing packages..."
sudo apt install -y "${PACKAGES[@]}"

echo "Development environment setup completed successfully!"