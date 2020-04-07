#!/bin/bash

# makes a backup of the original before.rules file
sudo cp /etc/ufw/before.rules /etc/ufw/before.rules.bak

# ok icmp codes for INPUT
# Replaces ACCEPT for DROP

duA1="-A ufw-before-input -p icmp --icmp-type destination-unreachable -j ACCEPT"
duD1="-A ufw-before-input -p icmp --icmp-type destination-unreachable -j DROP"

teA1="-A ufw-before-input -p icmp --icmp-type time-exceeded -j ACCEPT"
teD1="-A ufw-before-input -p icmp --icmp-type time-exceeded -j DROP"

ppA1="-A ufw-before-input -p icmp --icmp-type parameter-problem -j ACCEPT"
ppD1="-A ufw-before-input -p icmp --icmp-type parameter-problem -j DROP"

erA1="-A ufw-before-input -p icmp --icmp-type echo-request -j ACCEPT"
erD1="-A ufw-before-input -p icmp --icmp-type echo-request -j DROP"

sudo sed -i -e "s/$duA1/$duD1/g" /etc/ufw/before.rules
sudo sed -i -e "s/$teA1/$teD1/g" /etc/ufw/before.rules
sudo sed -i -e "s/$ppA1/$ppD1/g" /etc/ufw/before.rules
sudo sed -i -e "s/$erA1/$erD1/g" /etc/ufw/before.rules


# ok icmp code for FORWARD
duA2="-A ufw-before-forward -p icmp --icmp-type destination-unreachable -j ACCEPT"
duD2="-A ufw-before-forward -p icmp --icmp-type destination-unreachable -j DROP"

teA2="-A ufw-before-forward -p icmp --icmp-type time-exceeded -j ACCEPT"
teD2="-A ufw-before-forward -p icmp --icmp-type time-exceeded -j DROP"

ppA2="-A ufw-before-forward -p icmp --icmp-type parameter-problem -j ACCEPT"
ppD2="-A ufw-before-forward -p icmp --icmp-type parameter-problem -j DROP"

erA2="-A ufw-before-forward -p icmp --icmp-type echo-request -j ACCEPT"
erD2="-A ufw-before-forward -p icmp --icmp-type echo-request -j DROP"

sudo sed -i -e "s/$duA2/$duD2/g" /etc/ufw/before.rules
sudo sed -i -e "s/$teA2/$teD2/g" /etc/ufw/before.rules
sudo sed -i -e "s/$ppA2/$ppD2/g" /etc/ufw/before.rules
sudo sed -i -e "s/$erA2/$erD2/g" /etc/ufw/before.rules

sudo ufw reload
