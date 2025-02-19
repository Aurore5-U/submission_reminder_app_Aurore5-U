#!/bin/bash

# Ask the user for their name
echo "Enter your name:"
read yourName

# Create the main directory
mainDir="submission_reminder_${yourName}"
mkdir -p "$mainDir"

# Create subdirectories
mkdir -p "$mainDir/config"
mkdir -p "$mainDir/app"
mkdir -p "$mainDir/modules"
mkdir -p "$mainDir/assets"

# Create and populate files
# config.env
cat <<EOL > "$mainDir/config/config.env"
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL

# reminder.sh
cat <<EOL > "$mainDir/app/reminder.sh"

#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOL

# functions.sh
cat <<EOL > "$mainDir/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOL

# submissions.txt
cat <<EOL > "$mainDir/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Kellia, Shell Basics, submitted
Nkhomotabo, Git, not submitted
Aurore, python, submitted
Rolande, python, not submitted
Blessing, Git, submitted
EOL

# startup.sh
cat <<EOL > "$mainDir/startup.sh"
#!/bin/bash

# Load environment variables and functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Check if the submissions file exists
if [ ! -f "$submissions_file" ]; then
    echo "Error: Submissions file not found at $submissions_file"
    exit 1
fi

# Display assignment details from the environment variables
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "----------------------------------------------"

# Call the function to check sunmissions
check_submissions "$submissions_file"

# Final message
echo "Reminder app started successfully!"
EOL

# Make scripts executable
chmod +x "$mainDir/app/reminder.sh"
chmod +x "$mainDir/modules/functions.sh"
chmod +x "$mainDir/startup.sh"

echo "Environment setup complete! Directory: $mainDir"
