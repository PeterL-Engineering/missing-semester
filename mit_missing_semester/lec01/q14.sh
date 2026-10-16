#!/usr/bin/env bash

# Count how many lectures are listed on course website

curl https://missing.csail.mit.edu/ | grep -cE '[0-9]+/[0-9]+/26'