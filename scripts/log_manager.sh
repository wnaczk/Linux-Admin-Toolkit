#!/bin/bash

LOG_FILE="../test_data/logs/system.log"

echo "==============================================================="
echo "			LOG MANAGER"
echo "==============================================================="

if [ ! -f "$LOG_FILE" ]; then
	echo "ERROR: Log file does not exist!"
	exit 1
fi

total=$(wc -l < "$LOG_FILE")
errors=$(grep -c "ERROR" "$LOG_FILE")
warnings=$(grep -c "Warning" "$LOG_FILE")
info=$(grep -c "INFO" "$LOG_FILE")

echo "Total log entries: $total"
echo "Errors: $errors"
echo "Warnings: $warnings"
echo "Info: $info"

echo "==============================================================="
echo "			ERROR DETAILS"
echo "==============================================================="

grep "ERROR" "$LOG_FILE"


