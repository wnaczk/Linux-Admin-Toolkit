#!/bin/bash

echo "====================================================="
echo "			BACKUP MANAGER"
echo "====================================================="
backup_date=$(date +"%Y-%m-%d_%H-%M-%S")
echo "Date: $backup_date"
echo "User: $(whoami)"

source_dir="../test_data"
echo "Source directory: $source_dir"

backup_dir="../backups"

if [ ! -d "$backup_dir" ]; then
	mkdir -p "$backup_dir"
	echo "Utworzono katalog backups."
else 
	echo "Katalog backups już istnieje."
fi

if [ ! -d "$source_dir" ]; then
	echo "ERROR: Source directory does not exist!"
	exit 1
fi

tar -czf "$backup_dir/backup_$backup_date.tar.gz" -C "$source_dir" .

if [ $? -eq 0 ]; then
	echo "SUCCESS: Backup completed successfully!"
	echo "Archive: $backup_dir/backup_$backup_date.tar.gz"
else
	echo "ERROR: Backup failed!"
	exit 1
fi
