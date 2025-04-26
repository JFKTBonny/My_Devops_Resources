#!/bin/bash

# Variables
CRON_JOB="0 * * * * /path/to/your/command"  # Runs every hour

# Add cron job
( crontab -l; echo "$CRON_JOB" ) | crontab -

echo "Cron job added successfully!"