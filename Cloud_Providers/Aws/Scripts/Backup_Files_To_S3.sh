#!/bin/bash

# Backup Script

BUCKET_NAME="my-backup-bucket"
SOURCE_DIR="/path/to/backup"
DESTINATION="s3://$BUCKET_NAME/backup-$(date +%Y%m%d)/"

echo "Starting backup to S3 bucket: $BUCKET_NAME"
aws s3 sync $SOURCE_DIR $DESTINATION
echo "Backup completed!"