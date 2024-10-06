#!/bin/bash

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if a package name was provided as an argument
if [ -z "$1" ]; then
    echo -e "${RED}Error: Please provide a package name.${NC}"
    exit 1
fi

# Install the package using pip
echo -e "${YELLOW}Installing $1...${NC}"
pip install "$1"

# Check if the installation was successful
if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to install $1.${NC}"
    exit 1
fi

# Freeze the current environment and write to requirements.txt
echo -e "${YELLOW}Updating requirements.txt...${NC}"
pip freeze > requirements.txt

echo -e "${GREEN}$1 installed and requirements.txt updated successfully!${NC}"
