#!/bin/bash

# systemInfo cpu memory disk

# cpu

cpu_icon=""
cpu_info=$(top -n 1 -b | sed -n '3p' | awk '{printf "%d%", 100 - $8}')
cpu_text="$cpu_icon:$cpu_info"

# memory

memory_icon=""
memory_info=$(free --mebi | sed -n '2{p;q}' | awk '{printf ("%02d%", ($3 * 100 / $2))}')
memory_text="$memory_icon:$memory_info"

# disk

disk_icon="󰋊"
disk_info=$(df -h / | awk '/[0-9]/ {print $3 "/" $2}')
disk_text="$disk_icon:$disk_info"

systemInfo="$cpu_text $memory_text $disk_text"

printf "%s" "$systemInfo"
