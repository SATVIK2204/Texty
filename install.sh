#!/bin/bash

# Specify the path to the directory where the "texty" binary is located
texty_PATH="./bin"
DESTINATION_PATH="$texty_PATH" # Assuming DESTINATION_PATH is the same as texty_PATH

# Check if the directory and binary exist
if [ -d "$texty_PATH" ]; then
  if [ -f "$texty_PATH/texty" ]; then
    # Remove the existing binary
    rm "$texty_PATH/texty"
    echo "Removed existing 'texty' binary from $texty_PATH"
  else
    echo "'texty' binary not found in $texty_PATH"
  fi
else
  # Create the directory if it doesn't exist
  mkdir -p "$texty_PATH"
  echo "Created directory $texty_PATH"
fi

# Build the new binary
go build -o "$DESTINATION_PATH/texty" ./src/main.go

# Set the environment variable
export texty_HOME="$texty_PATH"

# Add the directory to the PATH
export PATH="$texty_PATH:$PATH"

echo "Environment variable texty_HOME set to $texty_HOME"
echo "Directory $texty_PATH added to PATH"
