# Project 19 - Scheduled S3 Backup

## Goal
Automate log backup to Amazon S3 using a scheduled cron job.

## Implementation
- Created sample application and system log files.
- Created a Bash backup script using AWS CLI.
- Uploaded logs to a timestamped S3 directory.
- Scheduled the backup script using cron to run every 5 minutes.

## S3 Bucket
krishnesh-project19-scheduled-backup-590507089733

## Cron Schedule
*/5 * * * *

## Verification
Confirmed multiple timestamped backup directories in Amazon S3 containing:
- application.log
- system.log

## Backup Script
The backup script uploads the logs recursively to S3 using a timestamped folder.
