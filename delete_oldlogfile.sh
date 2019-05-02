#/bin/bash
######################################
#Script Name: Log_file_deletion.sh
#Summary: Delete the log file and sub-directoy older that 7 days
#Author: Pradeep Bhuyan
#Date: 01-May-2019
######################################

if [ $# -ne 1 ]; then
    echo "Need one argument, which would be the log file path."
    exit 1
fi

LOG_DIRS=$1
LOG_FILE="/home/ec2-user/log.txt"

exec 1>$LOG_FILE
exec 2>>$LOG_FILE

TIMESTAMP=`date +%Y:%m:%d`

DAYS_OLD="7" # This will find and delete folders and files older than 7 days.

echo "....................................."
echo "Starting Deletion job on : $TIMESTAMP"

echo "Looking for Files in $DIR"
find $DIR -type f -mtime $DAYS_OLD
find $DIR -type f -mtime $DAYS_OLD -exec rm -f {} \;
echo "Deleted found files"

echo "Now Looking for Empty Folders Older than $DAYS_OLD Days"
find $DIR -type d -empty -mtime +$DAYS_OLD
find $DIR -type d -empty -mtime +$DAYS_OLD -exec rm -rf {} \;

echo "Cleanup on $TIMESTAMP completed"
exit 0
