#!/usr/bin/env bash

# Check if argument was given

if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <filename>" >&2
    exit 1
fi

filename="$1"

if [ -f "$filename" ]; then
    echo "$filename found."
else
    echo "$filename not found."
fi