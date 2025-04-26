#!/bin/bash

# Variables
SOURCE_DIR="/path/to/source"
BACKUP_DIR="/path/to/backup"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

# Create backup
echo "Creating backup of $SOURCE_DIR to $BACKUP_FILE..."
tar -czf $BACKUP_FILE $SOURCE_DIR

echo "Backup completed successfully!"



# #!/bin/bash

# SOURCE_DIR="$1"
# BACKUP_DIR="$2"

# if [ -z "$SOURCE_DIR" ] || [ -z "$BACKUP_DIR" ]; then
#   echo "Usage: $0 <source_dir> <backup_dir>"
#   exit 1
# fi

# TIMESTAMP=$(date +"%Y%m%d%H%M")
# BACKUP_NAME="backup_$TIMESTAMP.tar.gz"

# tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE_DIR"
# echo "Backup of $SOURCE_DIR created at $BACKUP_DIR/$BACKUP_NAME"



# #!/bin/bash

# # Variables
# SOURCE_DIR="/path/to/source"
# BACKUP_DIR="/path/to/backup"
# DATE=$(date +%Y%m%d_%H%M%S)
# BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

# # Create backup
# tar -czf "$BACKUP_FILE" "$SOURCE_DIR"
# echo "Backup of $SOURCE_DIR created at $BACKUP_FILE."