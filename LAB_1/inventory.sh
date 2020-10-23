#!/bin/bash
#Created by Maciej Jarystow
#jm44347

#creating catalouge form current date
NOW=$(date +"%Y-%m-%d__%H:%M:%S")
mkdir $NOW && cd $NOW
# 1) 
(echo "HOSTNAME: " && cat /proc/sys/kernel/hostname) | tr -d '\n' > "host.txt"
echo >> "host.txt"
(echo "SYSTEM " && cat /etc/os-release | grep -Ei "VERSION=") | tr -d '\n' >> "host.txt"
echo >> "host.txt"
hostnamectl | grep -E "Kernel:" | sed -e 's/^[[:space:]]*//' >> "host.txt"

# 2)
ps -aux > "proc.txt"

# 3)
netstat -pa > "sevices.txt"

# 4)
echo "USERS: " > "users.txt"
echo >> "users.txt"
cat /etc/passwd | cut -d: -f1 >> "users.txt"
echo >>"users.txt"
echo >> "users.txt"
echo "GROUPS: " >> "users.txt"
cat /etc/group | cut -d: -f1 >> "users.txt"