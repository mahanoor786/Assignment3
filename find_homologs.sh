#!/bin/bash

query=$1
subject=$2
output=$3

tblastn -query "$query" -subject "$subject" \
    -outfmt '6 qseqid sseqid pident length qlen' |
awk '$3 > 30 && $4 > 0.90 * $5' > "$output"

wc -l < "$output"

#testing revert