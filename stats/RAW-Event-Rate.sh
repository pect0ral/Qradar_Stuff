#!/bin/bash
# --
# 2020 Mike Piekarski
# --
# This will return a cleanly readable raw event rate for 5 Seconds, 30 Seconds and 1 Minute with the timestamp.
# This is useful for getting the raw event rate a specific time or for performing quick analysis on incoming event rates.
# -- 

awk '/ raw event rate/ { printf("%s %s %s\t 5s: %s\t30s: %s\t1m: %s\n", $1, $2, $3, $17, $20, $23)}' /var/log/qradar.log
