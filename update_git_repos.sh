#!/usr/bin/env bash

# Script to update git repositories in the /opt/ directory

# Define the directory containing the git repositories
GIT_DIR="/opt"

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

# Check if the directory exists
if [[ ! -d "$GIT_DIR" ]]; then
    echo "Directory $GIT_DIR does not exist."
    exit 1
fi

# Function to add a directory to git's safe.directory configuration
add_safe_directory() {
    local dir=$1
    if ! git config --global --get-all safe.directory | grep -Fxq "$dir"; then
        git config --global --add safe.directory "$dir"
    fi
}

# Loop through all directories in the specified directory
for dir in "$GIT_DIR"/*; do
    # Check if it is a directory and contains a .git folder
    if [[ -d "$dir" && -d "$dir/.git" ]]; then
        echo "Checking repository: $dir"
        
        # Navigate to the repository directory
        cd "$dir" || { echo "Failed to navigate to $dir"; exit 1; }
        
        # Add the directory to the safe directory list
        add_safe_directory "$dir"
        
        # Fetch the latest changes from the remote repository
        git fetch origin
        
        # Check if there are any updates
        LOCAL=$(git rev-parse @)
        REMOTE=$(git rev-parse @{u})
        
        if [[ "$LOCAL" != "$REMOTE" ]]; then
            echo "Updating repository: $dir"
            
            # Pull the latest changes
            git pull origin
            
            if [[ $? -ne 0 ]]; then
                echo "Failed to update repository: $dir"
            else
                echo "Repository $dir updated successfully."
            fi
        else
            echo "Repository $dir is already up-to-date."
        fi
    fi
done

echo "All repositories in $GIT_DIR have been checked."
