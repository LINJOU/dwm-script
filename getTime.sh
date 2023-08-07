#!/bin/sh

clock_icon=""
date_icon=""

LOCALTIME=$(date +"${date_icon} %y/%m/%d(%a) ${clock_icon} %H:%M")
printf "${LOCALTIME}"
