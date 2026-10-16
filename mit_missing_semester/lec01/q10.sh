#!/usr/bin/env bash

# Check if an argument was given
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <filename>" >&2
    exit 1
fi

filename="$1"
cp "$filename" "${filename}_$(date +%Y-%m-%d)"