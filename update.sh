#!/bin/bash

# Log file location
LOG_FILE="/var/log/update_script.log"

# Function to log messages to the log file
log_message() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') $1" >> "$LOG_FILE"
}

# Check which package manager is available (yum or dnf)
if command -v yum &> /dev/null; then
    PACKAGE_MANAGER="yum"
elif command -v dnf &> /dev/null; then
    PACKAGE_MANAGER="dnf"
else
    log_message "Error: Neither yum nor dnf found. Exiting."
    exit 1
fi

# Update packages and log the results
log_message "Starting system update..."

if sudo "$PACKAGE_MANAGER" check-update >> "$LOG_FILE" 2>&1; then
    log_message "Updates available. Installing..."
    if sudo "$PACKAGE_MANAGER" upgrade -y >> "$LOG_FILE" 2>&1; then
        log_message "Update successful."
    else
        log_message "Error: Update failed. Check $LOG_FILE for details."
    fi
else
    log_message "No updates available."
fi

# End message in the log
log_message "Update check completed."


