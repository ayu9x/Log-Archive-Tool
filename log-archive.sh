#!/bin/bash

# Log Archive Tool
# Usage: ./log-archive.sh <log-directory>

# Check if an argument was provided
if [ -z "$1" ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

LOG_DIR=$1
ARCHIVE_DIR="archives"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
LOG_FILE="${ARCHIVE_DIR}/archive_log.txt"

# Check if the directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory '$LOG_DIR' does not exist."
    exit 1
fi

# Create archive directory if it doesn't exist
if [ ! -d "$ARCHIVE_DIR" ]; then
    mkdir -p "$ARCHIVE_DIR"
fi

# Compress the logs
echo "Archiving logs from: $LOG_DIR"
tar -czf "${ARCHIVE_DIR}/${ARCHIVE_NAME}" -C "$(dirname "$LOG_DIR")" "$(basename "$LOG_DIR")"

# Check if compression was successful
if [ $? -eq 0 ]; then
    echo "Archive created successfully: ${ARCHIVE_DIR}/${ARCHIVE_NAME}"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] Archived ${LOG_DIR} to ${ARCHIVE_NAME}" >> "$LOG_FILE"
else
    echo "Error: Failed to create archive."
    exit 1
fi
