#!/usr/bin/env bash

# script is ran in 3 different modes
# 1. "bash check_hashes.sh" / this is a cronjob or admin usage to check hashes to make sure they are the same as the hashes.txt file in root folder
# 2. "bash check_hashes.sh <folder> new" / this adds a new hashes.txt file or appends to hashes.txt file if exists the .sh scripts hashes from <folder>
# 3. "bash check_hashes.sh <folder> update" / this updates the hashes after user has made changes to a .sh script. "<folder> MUST BE called" ~~bash check_hashes update~~ # will not work.

# Function to calculate sha256 hash of a file
calculate_hash() {
    local file="$1"
    sha256sum "$file" | cut -d ' ' -f 1
}

# Function to update hashes
update_hashes() {
    local dir="$1"
    local hash_file="$2"
    local mode="$3"
    
    # Create temporary file for the current hashes
    local temp_hashes
    temp_hashes=$(mktemp)

    # Traverse through the directory and its subdirectories
    find "$dir" -type f -name "*.sh" | while read -r file; do
        if [ -f "$file" ]; then
            local hash
            hash=$(calculate_hash "$file")
            echo "$hash $file" >> "$temp_hashes"
        fi
    done

    if [ "$mode" == "new" ]; then
        # Append to the main hash file
        cat "$temp_hashes" >> "$hash_file"
        echo "Hashes for $dir added successfully."
    elif [ "$mode" == "update" ]; then
        # Remove existing hashes for the directory from the hash file
        grep -v "$dir" "$hash_file" > "${hash_file}.tmp"
        mv "${hash_file}.tmp" "$hash_file"
        # Append the updated hashes to the main hash file
        cat "$temp_hashes" >> "$hash_file"
        echo "Hashes for $dir updated successfully."
    else
        # Compare current hashes with stored hashes
        local diff_output
        diff_output=$(grep "$dir" "$hash_file" | diff - "$temp_hashes")

        # If differences found, warn the user
        if [ -n "$diff_output" ]; then
            echo "Warning: Changes detected in scripts for directory $dir!"
            echo "$diff_output"
        else
            echo "All script hashes for directory $dir match the system."
        fi
    fi

    # Clean up temporary file
    rm "$temp_hashes"
}

# Main function
main() {
    local directory="$1"
    local hash_file="/root/Documents/hashes.txt"
    local mode="$2"

    # Ensure the hash directory exists
    mkdir -p "$(dirname "$hash_file")"

    # Check if hashes file exists
    if [ ! -f "$hash_file" ]; then
        touch "$hash_file"
    fi

    # Update or add hashes
    update_hashes "$directory" "$hash_file" "$mode"
}

# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

# Check if directory argument provided
if [ -z "$1" ]; then
    echo "Usage: $0 <directory_path> [new|update]"
    exit 1
fi

# Run main function with directory and mode
main "$1" "$2"
