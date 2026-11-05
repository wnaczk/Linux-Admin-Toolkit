#!/bin/bash

echo "===================================================="
echo "		PROCESS MANAGER"
echo "===================================================="

echo "Date: $(date)"
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime -p)"

total=$(ps -e --no-headers | wc -l)

echo "Total processes: $total"

echo "===================================================="
echo "		 TOP CPU PROCESSES"
echo "===================================================="

ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

echo "===================================================="
echo "		TOP MEMORY PROCESSES"
echo "===================================================="

ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -n 6
