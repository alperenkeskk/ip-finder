#!/bin/bash


echo "-----------------------------------"
echo "Your IP Address"
your_ip=$( ip a | awk '/inet /{print substr($2,1)}' | awk 'FNR == 2 {print}' )
echo "$your_ip"
echo "-----------------------------------"

echo "Do you want download nmap for find IPs in the network? (y/n): "

read yesno

if [ $yesno == 'y' ]
then
    sudo apt-get install nmap

    clear

    echo "-----------------------------------"
    echo "Your IP Address"
    echo "$your_ip"
    echo "-----------------------------------"

    echo "IPs in the network"
    nmap  $your_ip | grep "scan report" | awk '{print $5}'
else
    echo "Bye!"
fi
