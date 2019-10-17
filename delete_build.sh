#/bin/bash
######################################
#Script Name: build_deletion.sh
#Summary: Delete the log file and sub-directoy older that 7 days
#Author: pbhuy002 
#Date: 10-oct-2019
######################################

LOG_FILE="/tmp/build.txt"

exec 1>$LOG_FILE            #################output to logfile
#exec 2>>$LOG_FILE

TIMESTAMP=`date +%Y:%m:%d`     ############current time

echo "....................................."
echo "Starting Deletion job on : $TIMESTAMP"

echo "Deleted found dir"

echo "Now Looking for Folders Older than 60 Days"

find /root/*/build/ -type d -mtime +60 -exec rm -rf {} \;

echo "Cleanup on $TIMESTAMP completed"
exit 0

