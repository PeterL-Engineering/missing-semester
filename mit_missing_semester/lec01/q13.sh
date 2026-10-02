#!/usr/bin/env bash

# Find line counts per .sh file

find . -name '*.sh' -print0 | xargs -0 wc -l