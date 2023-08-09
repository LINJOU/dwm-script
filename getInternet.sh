#!/bin/bash

# internet

wifi_icons=("󰣾" "󰣴" "󰣶" "󰣸" "󰣺")

case "$(cat /sys/class/net/w*/operstate 2>/dev/null)" in
	down) 
		case "$(cat /sys/class/net/e*/operstate 2/dev/null)" in
			down) 
				neticon="󰲛"
				;;
			up)
				neticon="󰱓"
				;;
		esac
		;;
	up) 
		index=$(awk '/^\s*w/ { print int($3 * 10 / 175) }' /proc/net/wireless)
		neticon=${wifi_icons[$index]}
		;;
esac

printf "%s" "$neticon"
