#!/bin/bash

# Pi-hole Backup Script

# Configuration
BACKUP_DIR="/home/usr/backup_Pihole" # Change the location of your backup file
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Run the Pi-hole Teleporter tool to create a backup in the default directory
echo "Creating a Pi-hole backup using Teleporter..."
pihole -a -t

# Find the name of the generated Teleporter backup file in the script's directory
BACKUP_FILE=$(find "$(dirname "$0")" -name "*.tar.gz" -type f)

# Check if the backup file exists
if [ -f "$BACKUP_FILE" ]; then
  # Move the generated Teleporter backup to the specified directory
  mv "$BACKUP_FILE" "$BACKUP_DIR/"
  echo "Pi-hole backup created and saved to: $BACKUP_DIR/$(basename $BACKUP_FILE)"
else
  echo "Pi-hole backup failed."
fi
