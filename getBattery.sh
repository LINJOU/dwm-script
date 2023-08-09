#!/bin/bash

# battery

bat_info=$(acpi -b | awk -F '[, ]' '{print $3,$5}')

if [ "$bat_info" ]; then

	bat_capacity_text=$(echo ${bat_info#*" "})
	bat_capacity=$(echo ${bat_capacity_text%*"%"})
	bat_status=$(echo ${bat_info: 0:1})
	bat_icons=("󰂃" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹")

	if (( "$bat_status" == "D" )); then

		index=`expr $bat_capacity / 10`
		bat_icon=${bat_icons[$index]}
		bat_text="$bat_icon $bat_capacity%" 

	else
		bat_text="󰂄 $bat_capacity%"
	fi

else 
	bat_text="󱉞"
fi

printf "%s" "$bat_text"
