#!/bin/bash

# Variables
USERNAME="newuser"
PASSWORD="password"

# Create user
echo "Creating user $USERNAME..."
sudo useradd -m $USERNAME
echo "$USERNAME:$PASSWORD" | sudo chpasswd

echo "User $USERNAME created successfully!"