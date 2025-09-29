#!/usr/bin/env bash

# Função para pegar volume
get_volume() {
    amixer get Master | awk -F'[][]' 'END{ print $2 }'
}

while true; do
    CPU=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.0f%%", usage}')
    RAM=$(free -h | awk '/^Mem/ {print $3 "/" $2}')
    DISK=$(df -h / | awk 'NR==2 {print $4 " free"}')
    VOL=$(get_volume)
    DATE=$(date '+%Y-%m-%d %H:%M:%S')

    echo "CPU: $CPU | RAM: $RAM | Disk: $DISK | Vol: $VOL | $DATE"
    sleep 1
done
