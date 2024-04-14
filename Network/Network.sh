#!/bin/bash
IP=$(ip addr show | grep "inet " | tail -n 1 | cut -d" " -f6 | cut -d"/" -f1)
SUBNET_MASK=$(ip addr show | grep inet | tail -n 1 | cut -d" " -f6 | cut -d"/" -f2)
GATEWAY=$(ip route show | head -n 1 | cut -d" " -f3)
DNS=$(resolvectl | grep 'Current DNS' | cut -d" " -f4)
echo "Your IP address is $IP"
echo "Your Subnet Mask is $SUBNET_MASK"
echo "Your Gateway is $GATEWAY"
echo "Your DNS address is $DNS"
