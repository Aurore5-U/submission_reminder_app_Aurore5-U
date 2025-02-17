#!/bin/bash

# Load environment variables and functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Check if the submissions file exists
if [ ! -f "" ]; then
    echo "Error: Submissions file not found at "
    exit 1
fi

# Display assignment details from the environment variables
echo "Assignment: "
echo "Days remaining to submit:  days"
echo "----------------------------------------------"

# Call the function to check sunmissions
check_submissions ""

# Final message
echo "Reminder app started successfully!"

# Make scripts executable
chmod +x "submission_reminder_ghhh/app/reminder.sh"
chmod +x "submission_reminder_ghhh/modules/functions.sh"
chmod +x "submission_reminder_ghhh/startup.sh"

echo "Environment setup complete! Directory: submission_reminder_ghhh"
