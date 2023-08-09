#!/bin/bash

# net speed

update() {
	sum=0
	for arg; do
		read -r i < "$arg"
		sum=$(( sum + i ))
	done
	cache=${XDG_CACHE_HOME:-$HOME/.cache}/${1##*/}
	[ -f "$cache" ] && read -r old < "$cache" || old=0
	printf %d\\n "$sum" > "$cache"
	printf %d\\n $(( sum -old ))
}

# TX: upload TX: download
RX=$(update /sys/class/net/[ew]*/statistics/rx_bytes)
TX=$(update /sys/class/net/[ew]*/statistics/tx_bytes)

if [[ $RX -lt 1024 ]];then
	RX="${RX}B/s"
elif [[ $RX -gt 1048576 ]];then
	RX=$(echo $RX | awk '{print int($1/1048576) "MB/s"}')
else
	RX=$(echo $RX | awk '{print int($1/1024) "KB/s"}')
fi

if [[ $TX -lt 1024 ]];then
	TX="${TX}B/s"
elif [[ $TX -gt 1048576 ]];then
	TX=$(echo $TX | awk '{print int($1/1048576) "MB/s"}')
else
	TX=$(echo $TX | awk '{print int($1/1024) "KB/s"}')
fi

printf ":$TX :$RX"
