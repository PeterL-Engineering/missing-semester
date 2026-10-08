#!/usr/bin/env bash

n=0
error='FALSE'

while [[ error != 'TRUE' ]]; do
    n++;

    ./q5_example stdout>q5out.txt stderr>q5err.txt
    if [[ stdout ==  "Something went wrong"]]; then
        error='TRUE'
    fi
done

echo ./q5out.txt
echo ./q5err.txt
