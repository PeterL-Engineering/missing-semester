#!/usr/bin/env bash

# Print lines where the second column is greater than 100,
# and sawap the first and third columns.

awk '$2 > 100 {tmp=$1; $1=$3; $3=tmp; print}'