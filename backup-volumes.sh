#!/bin/bash

# Get current date in DD-MM-YYYY format
DATE=$(date +%d-%m-%Y)

# Create backup filename
BACKUP_FILENAME="docker-volumes-backup-$DATE.tar.gz"

# Navigate to the /var/lib/docker/volumes directory
cd /var/lib/docker/volumes/

# Create a list of all directories inside /var/lib/docker/volumes/
DIRECTORIES=$(ls -d */)

# Create a tar archive of the directories and compress it
tar czf "$BACKUP_FILENAME" $DIRECTORIES

# Move the backup file to the directory where this script is located
mkdir /home/ubuntu/docker/volume-backups/
mv "$BACKUP_FILENAME" "/home/ubuntu/docker/volume-backups/"

echo "Done! Remember to delete the volume-backups/ directory."
