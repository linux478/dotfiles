#!/bin/bash

# Function to check if a command exists in the system's PATH
is_command_installed() {
  command -v "$1" >/dev/null 2>&1
  return $?
}

# Get the software name as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <software_command>"
  echo "Example: $0 git"
  exit 1
fi

software_command="$1"

if is_command_installed "$software_command"; then
  echo "✅ '$software_command' is installed (found in PATH)."
  # Optionally, you can get the path to the executable:
  executable_path=$(which "$software_command")
  echo "   Location: $executable_path"
else
  echo "❌ '$software_command' is NOT installed (not found in PATH)."
fi

exit 0
