#!/bin/sh

# date and time

date_icon=""
time_icons=("" "" "" "" "" "" "" "" "" "" "" "")

time=$(date '+%I')
index=`expr $time - 1`
time_icon=${time_icons[$index]}

LOCALTIME=$(date +"${date_icon} %y/%m/%d(%a) ${time_icon} %H:%M")
printf "${LOCALTIME}"
