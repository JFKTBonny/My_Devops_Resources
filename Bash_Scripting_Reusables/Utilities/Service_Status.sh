#!/bin/bash

# Variables
SERVICE_NAME="nginx"

# Check service status
if systemctl is-active --quiet $SERVICE_NAME; then
    echo "$SERVICE_NAME is running."
else
    echo "$SERVICE_NAME is not running. Restarting..."
    sudo systemctl restart $SERVICE_NAME
    echo "$SERVICE_NAME has been restarted."
fi