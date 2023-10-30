#!/bin/bash

# Pi-hole Backup Script

# Configuration
BACKUP_DIR="/home/usr/backup_Pihole" # Updated backup directory
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILE="${BACKUP_DIR}/pihole-teleporter-backup-${TIMESTAMP}.tar.gz"

# Check if the backup directory exists, and create it if not
if [ ! -d "$BACKUP_DIR" ]; then
  mkdir -p "$BACKUP_DIR"
fi

# Run the Pi-hole Teleporter tool to create a backup
echo "Creating a Pi-hole backup using Teleporter..."
pihole -a -t

# Move the generated Teleporter backup to the specified directory
mv /etc/pihole/teleporter/${TIMESTAMP}.tar.gz "$BACKUP_FILE"

# Check if the backup was successfully created and moved
if [ -f "$BACKUP_FILE" ]; then
  echo "Pi-hole backup created and saved to: $BACKUP_FILE"
else
  echo "Pi-hole backup failed."
fi
