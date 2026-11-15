#!/usr/bin/env bash

n=0
error='FALSE'

> q5out.txt
> q5err.txt

while [[ $error != 'TRUE' ]]; do
    n=$(( n + 1 ))

    ./q5_example 1>>q5out.txt 2>>q5err.txt
    if grep -q "Something went wrong" q5out.txt; then
        error='TRUE'
    fi
done

cat q5out.txt
cat q5err.txt
echo "$n trials before error"