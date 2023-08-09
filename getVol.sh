#!/bin/bash

# alsa

volume_icons=("󰕿" "󰖀" "󰕾")

valume_info=$(amixer get Master | tail -n1 | sed -n "s/.*\[\([^]]*\)%\].*\[\([^]]*\)\]/\1 \2/p")

valume_status=$(echo ${valume_info#*" "})
valume_value=$(echo $valume_info | awk -F '[% ]' '{print $1}')

case $valume_status in
	off)
		valume_status_icon="󰖁"
		;;
	on)
		index=`expr $valume_value / 40`
		valume_status_icon=${volume_icons[$index]}

esac

printf "%s" "$valume_status_icon $valume_value%"
