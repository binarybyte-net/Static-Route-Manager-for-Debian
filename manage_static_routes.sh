#!/bin/bash

ROUTE_FILE="/etc/my_static_routes.conf"

echo -n "Do you want to ADD or DELETE static route? Type (ADDIP or DELETEIP): "
read ADDorDELETE

if [[ $ADDorDELETE == "ADDIP" ]]; then
    echo -n "Type IP (with or without subnet mask) you want to ADD. For example (10.10.10.10/24): "
    read ADDIP
    sudo /usr/sbin/ip route add $ADDIP via 192.168.190.250 dev ens192
    echo "$ADDIP via 192.168.190.250 dev ens192" | sudo tee -a $ROUTE_FILE > /dev/null
    echo "Static route with IP $ADDIP has been added at $(date)." | tee -a /home/debian/added.txt

elif [[ $ADDorDELETE == "DELETEIP" ]]; then
    echo -n "Type IP (with or without subnet mask) you want to DELETE. For example (10.10.10.10/24): "
    read DELETEIP
    sudo /usr/sbin/ip route del $DELETEIP via 192.168.190.250 dev ens192
    sudo sed -i "\|$DELETEIP via 192.168.190.250 dev ens192|d" $ROUTE_FILE
    echo "Static route with IP $DELETEIP has been removed at $(date)." | tee -a /home/debian/removed.txt
fi
