#!/usr/bin/env bash

# Most recently modified file, recursively
find . -type f -printf "%T@ %p\n" | sort -n -r | head -n 1

# All files by recency (newest first)
find . -type f -printf "%T@ %p\n" | sort -n -r