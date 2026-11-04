#!/bin/bash

echo "===================================================="
echo "			DISK MONITOR"
echo "===================================================="

echo "SYSTEM INFORMATION"
echo "----------------------------------------------------"
echo "Date:			 $(date)"
echo "Hostname:		 $(hostname)"
echo "===================================================="

echo "DISK STATUS"
echo "----------------------------------------------------"
disk_usage=$(df -h "$HOME" | awk 'NR==2 {print $5}' | tr -d '%')
echo "Disk usage: $disk_usage%"

if [[ $disk_usage -ge 85 ]]; then
	status="CRITICAL"
	message="Disk space is almost full!"
elif [[ $disk_usage -ge 70 ]]; then
	status="WARNING"
	message="Disk space usage is getting high."
else
	status="NORMAL"
	message="Disk space usage is within safe limits."
fi

printf "\nSTATUS:\t\t[%s]\n" "$status"
printf "Message:\t%s\n" "$message"

{
echo "==================================================="
echo "		DISK MONITOR REPORT"
echo "==================================================="
echo "Date:		 $(date)"
echo "DISK INFORMATION:" 
df -h "$HOME"
echo "STATUS: $status"
echo "Message: $message"
} >> ../reports/disk_report.txt
