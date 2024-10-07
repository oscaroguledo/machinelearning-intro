#!/bin/bash

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if a package name or requirements file was provided
if [ -z "$1" ]; then
    echo -e "${RED}Error: Please provide a package name or -r followed by a requirements file.${NC}"
    exit 1
fi

# Iterate through all the arguments passed to the script
while [[ "$#" -gt 0 ]]; do
  case $1 in
    -r)  # If the argument is '-r', treat the next argument as the requirements file
        shift
        if [ -f "$1" ]; then
            echo -e "${YELLOW}Installing packages from $1...${NC}"
            pip install -r "$1"
        else
            echo -e "${RED}Error: Requirements file $1 not found.${NC}"
            exit 1
        fi
        ;;
    *)  # Install individual packages
        echo -e "${YELLOW}Installing package: $1...${NC}"
        pip install "$1"
        if [ $? -ne 0 ]; then
            echo -e "${RED}Failed to install $1.${NC}"
            exit 1
        fi
        ;;
  esac
  shift
done

# Freeze the current environment and write to requirements.txt
echo -e "${YELLOW}Updating requirements.txt...${NC}"
pip freeze > requirements.txt

echo -e "${GREEN}Packages installed and requirements.txt updated successfully!${NC}"
