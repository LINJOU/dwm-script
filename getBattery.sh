#!/bin/bash

for battery in /sys/class/power_supply/BAT?*; do

	# case "$(cat "$batter/status" 2>&1)" in
		# 
	# esac
	
	status="$(cat "$batter/status" 2>&1)"
	capacity="$(cat "$battery/capacity" 2>&1)"
	printf "%d%%" "$capacity"
done
