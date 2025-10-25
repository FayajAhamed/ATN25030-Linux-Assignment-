#!/bin/bash
clear
echo ""
echo "                NETWORK ANALYZER"
echo "===================================================="
echo "              /\\      /\\"
echo "             {   ---  }"
echo "             {  O   O }"
echo "             ~~>  V  <~~"
echo "              \\  \\|/  /"
echo "                -----____"
echo "               /     \\    \\_"
echo "              {       }\\  )_\\_   _"
echo "              |  \\_/  |/ /  \\_\\_/ )"
echo "               \\__/  /(_/     \\__/"
echo "===================================================="
echo ""

if ! command -v netstat &> /dev/null; then
    echo "Error: netstat command not found. Please install net-tools package."
    exit 1
fi

connections=$(netstat -tun | grep ESTABLISHED)

if [ $? -ne 0 ];then
echo "Error: Failed to execute netstat."
exit 1

fi

if [ -z "$connections" ]; then
echo "No Connections found."
exit 0

fi

echo "$connections" | awk '{print $5}' | cut -d: -f1 | \
grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' | \
sort | uniq -c | sort -nr | \

awk '{printf "IP Address: %-15s | Connections: %d\n", $2, $1}'

echo ""
echo "===================================================="
echo "Scan complete — The Wolf watches the network."
echo "===================================================="


