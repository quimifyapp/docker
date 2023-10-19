#!/bin/bash

echo
echo "Creating backup..."
echo "Watch out for possible errors:"

# Get current date in DD-MM-YYYY format
DATE=$(date +%d-%m-%Y)

# Define volumes path
SOURCE_DIR="/var/lib/docker/volumes/"

# Create backup filename
BACKUP_FILENAME="docker-volumes-backup-$DATE.tar.gz"

# Define temporary backup directory in the script's location
TEMP_BACKUP_DIR=$(mktemp -d)

# Get the directory of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Create a temporary backup directory in the script's location
mkdir -p "$TEMP_BACKUP_DIR"

# Copy all subdirectories from the source to the destination
for folder in "$SOURCE_DIR"/*; do
  if [ -d "$folder" ]; then
    folder_name=$(basename "$folder")
    cp -r "$folder" "$TEMP_BACKUP_DIR/$folder_name"
  fi
done

cd "$TEMP_BACKUP_DIR"

# Create a list of all directories inside the temporary directory
DIRECTORIES=$(ls -d */)

# Create a tar archive of the contents of the temporary directory and compress it 
tar czf "$BACKUP_FILENAME" $DIRECTORIES

# Move the backup file to the directory where this script is located
mv "$BACKUP_FILENAME" "$SCRIPT_DIR"

# Clean up the temporary backup directory
rm -rf "$TEMP_BACKUP_DIR"

echo
echo "Backup done! Don't forget to move it."
