#!/bin/bash

# Check if a commit message is provided
if [ -z "$1" ]; then
  echo -e "\033[31mError: Commit message is required.\033[0m" # Red color for error
  exit 1
fi

# Variables
commit_message="$1"

# Stage all changes
echo -e "\033[33mStaging all changes...\033[0m" # Yellow color for info
git add .

# Commit with the provided message
echo -e "\033[32mCommitting with message: '$commit_message'\033[0m" # Green color for success
git commit -m "$commit_message"

# Push changes to the repository
echo -e "\033[34mPushing to the repository...\033[0m" # Blue color for push info
git push

# Confirmation of completion
echo -e "\033[32mChanges have been pushed successfully!\033[0m" # Green color for success
