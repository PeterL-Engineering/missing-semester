#!usr/bin/env bash

# find all the file types eg. .sv
# cut down to only unique types and count how many of each

find . -type f | sed 's/.*\././' | sort | uniq -c