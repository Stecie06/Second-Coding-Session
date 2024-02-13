#!/bin/bash

# Get negpod ID from first argument
negpod_id=$1

# Check if negpod ID is provided
if [[ -z "$negpod_id" ]]; then
  echo "Error: Please provide your negpod ID as an argument."
  exit 1
fi

# Create directory with negpod ID and question number
mkdir negpod_$negpod_id-q1

# Move files to the directory
mv main.sh students-list_1023.txt select-emails.sh student-emails.txt negpod_$negpod_id-q1

echo "Files moved successfully."
