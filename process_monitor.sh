#!/bin/bash
clear
echo ""
echo "===================================================="
echo "                    WELCOME "
echo "                 TIGER POWER!"
echo "===================================================="
echo "            /\\_/\  "
echo "           ( o.o ) "
echo "            > ^ <  "
echo "      Ready to monitor your processes!"
echo "===================================================="

if [ $# -eq 0 ]; then
    echo "Usage: $0 <number_of_processes>"
    echo "Example: $0 5"
    exit 1
fi


if ! [[ "$1" =~ ^[0-9]+$ ]]; then
    echo "Error: Please provide a valid number"
    exit 1
fi


if ! command -v ps &> /dev/null; then
    echo "Error: ps command not found"
    exit 1
fi

echo "Top $1 processes with highest CPU usage:"
echo "========================================"
ps -eo pid,user,%cpu,comm --sort=-%cpu | head -n $(($1 + 1))

echo "Process monitoring complete. Tiger is processing "
