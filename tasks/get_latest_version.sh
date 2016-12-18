#!/bin/sh
# Ensure this script runs in the become_user's home directory
cd ~
# Source pyenv initialization script
source $1
version_regex_str=$(echo "$2" | sed -e 's/x/[[:digit:]]/g' -e 's/\./\\./g')
regex_str="^[[:space:]]*${version_regex_str}[[:digit:]]*$"
pyenv install -l | grep -e "${regex_str}" | tail -n 1 | sed -e 's/[[:blank:]]//g'
