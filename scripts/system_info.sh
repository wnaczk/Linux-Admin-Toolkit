#!/bin/bash

echo "==================================="
echo "	SYSTEM INFORMATION"
echo "==================================="

echo "User: 		$(whoami)"
echo "Hostname: 	$(hostname)"
echo "Date:		$(date)"
echo "Uptime:		$(uptime)"

echo "Disk usage:"
df -h "$HOME"

echo "Memory:"
free -h
echo "==================================="
