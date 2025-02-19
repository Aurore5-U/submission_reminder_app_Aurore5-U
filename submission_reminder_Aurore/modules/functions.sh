#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file="$1"  # Accept the file path as a function argument

    # Check if the file exists
    if [[ ! -f "$submissions_file" ]]; then
        echo "Error: Submissions file not found at $submissions_file"
        return 1
    fi

    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    tail -n +2 "$submissions_file" | while IFS=, read -r student assignment status; do
        # Remove leading/trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "Shell Navigation" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $assignment assignment!"
        fi
    done
}

