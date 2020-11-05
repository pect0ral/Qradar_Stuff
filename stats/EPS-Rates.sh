#!/bin/bash
# --
# 2020 Mike Piekarski
# --
# This script will pull the peak and average EPS from the life of /var/log/qradar.log
# This is a useful metric just to gather the event rate of a specific appliance.
# Please note that this does not give environment-wide statistics and is specifically for pulling event rates from an individual appliance.
# --
awk '/ raw event rate/ { printf("%s %s %s\t 5s: %s\t29s: %s\t1m: %s\n", $1, $2, $3, $17, $20, $23)}' /var/log/qradar.log | awk 'BEGIN { PEAK=0.00; AVERAGE=0.00 } { AVERAGE=AVERAGE+$5; if ( $7 > PEAK ) PEAK=$7 } END { printf(" Average EPS is %s\n Peak is %s\n", AVERAGE/NR, PEAK )}'
