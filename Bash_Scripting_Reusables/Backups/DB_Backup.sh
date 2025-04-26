#!/bin/bash

# Variables
DB_NAME="your_database"
DB_USER="your_username"
DB_PASSWORD="your_password"
BACKUP_DIR="/path/to/backup"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_$TIMESTAMP.sql"

# Create database backup
echo "Backing up database $DB_NAME to $BACKUP_FILE..."
mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE

echo "Database backup completed successfully!"