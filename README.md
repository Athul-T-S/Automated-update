# Automated System Updates Script for MyComp

This project contains a Bash script designed to automatically check for and install system updates using either `yum` or `dnf`, depending on the package manager available on the system. The script ensures that servers stay up to date with the latest security patches and software updates, while logging the results of each update operation.

## Features

- **Automatic Update Checking**: The script checks for available updates using `yum` or `dnf`, depending on the Linux distribution.
- **Update Installation**: It automatically installs all available updates to keep the system secure and up to date.
- **Logging**: Detailed logs are maintained, including the date and time of the update, packages that were updated, and any errors encountered during the process.
- **Automation**: The script is designed to run regularly using a cron job, making the update process hands-free.

## Files

- `update_script.sh`: The main script that checks for and installs system updates and logs the results.

## Prerequisites

Ensure the following are set up on your system:

1. **yum** or **dnf**: The script checks for either `yum` or `dnf` as the package manager. At least one must be installed for the script to work.
2. **sudo privileges**: The script requires root privileges to install updates.

## How to Use

1. Clone this repository to your server:
   ```bash
   git clone https://github.com/your-username/automated-update.git
   cd automated-system-updates
Make the script executable:

bash
chmod +x update_script.sh
Run the script manually to check for updates and install them:

bash
sudo ./update_script.sh
The update logs can be found in /var/log/update_script.log.

Verifying the Script
After running the script, you can check the log file to verify the updates:
bash
cat /var/log/update_script.log
The log will include:
Date and time of the update check.
Whether updates were available.
A list of packages that were updated (if any).
Any errors that occurred during the update process.
Setting up Automation with Cron
To automate the script so that it runs daily:

Open the crontab editor:

bash
crontab -e
Add the following line to schedule the script to run every day at midnight:

bash
Copy code
0 0 * * * /path/to/update_script.sh
Verify the cron job is set up correctly:

bash
crontab -l
