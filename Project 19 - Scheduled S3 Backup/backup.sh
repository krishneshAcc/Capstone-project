#!/bin/bash

BUCKET="krishnesh-project19-scheduled-backup-590507089733"
SOURCE_DIR="$HOME/project19-backup/logs"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

echo "Starting S3 backup at $TIMESTAMP"

aws s3 cp "$SOURCE_DIR/" "s3://$BUCKET/backups/$TIMESTAMP/" --recursive

if [ $? -eq 0 ]; then
    echo "Backup completed successfully at $TIMESTAMP"
else
    echo "Backup failed at $TIMESTAMP"
fi
