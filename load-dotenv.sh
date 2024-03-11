#!/bin/bash

# Load environment variables from .env file
ENV_FILE=".env"

# Check if .env file exists
if [ ! -f "$ENV_FILE" ]; then
  echo "File $ENV_FILE does not exist."
  exit 1
fi

# Read .env file line by line
while IFS='=' read -r key value; do
  # Skip comments and empty lines
  if [[ "$key" =~ ^# || -z "$key" ]]; then
    continue
  fi
  # Set environment variable
  export "$key"="$value"
done < "$ENV_FILE"

echo "Environment variables loaded from $ENV_FILE"

