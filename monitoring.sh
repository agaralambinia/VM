#!/bin/bash

architecture=$(uname -snrvmo)
CPU=$(cat /proc/cpuinfo | grep "physical id"| wc -l)
vCPU=$(cat /proc/cpuinfo | grep "processor" | wc -l)
MemoryUsage=$(free -m | grep "Mem" | awk '{printf("%s/%sMB (%.2f%%)", $3, $2, ($3/$2)*100)}')
DiskUsage=$(df -h --total | grep "total" | awk '{printf("%.f/%.fGb (%s)", $3, $2, $5)}')
CPUload=$(top -bn1 | grep "Cpu" | awk '{printf("%.1f%%", $2 + $4)}')
LastBoot=$(uptime -s | awk '{printf("%s %s", $1, substr($2,1, length($2) - 3))}')
LVMuse=$(lsblk | grep "lvm" | wc -l | awk '{if ($1) {printf("yes");} else printf("no")}')
ConnectionsTCP=$(netstat -an | wc -l | awk '{printf("%s ESTABLISHED", $1)}')
Userlog=$(users | wc -w)
IP=$(hostname -I)
MAC=$(ip a | grep "ether")
Sudo=$(journalctl _COMM=sudo | grep "COMMAND" | wc -l)

echo "#Architecture:" $architecture
echo "#CPU physical:" $CPU
echo "#vCPU:" $vCPU
echo "#Memory Usage:" $MemoryUsage
echo "#Disk Usage:" $DiskUsage
echo "#CPU load:" $CPUload
echo "#Last boot:" $LastBoot
echo "#LVM use:" $LVMuse
echo "#Connections TCP:" $ConnectionsTCP
echo "#User log:" $Userlog
echo "#Network: IP "$IP" ("$MAC")"
echo "#Sudo:" $Sudo" cmd"