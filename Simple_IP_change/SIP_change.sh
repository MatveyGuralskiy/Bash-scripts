#!/bin/bash
#You should run a script with sudo permission
#It's a SIP (Simple IP) change script

function SIP(){
echo "Your current IPv4 address"
FIND_IPv4= ip addr | grep inet | grep enp* | cut -d'/' -f1 | awk '{print $2}'
sleep 2
echo "Your current IPv6 address"
FIND_IPv6= ip addr | grep inet6 | grep global | awk '{print $2}'
sleep 2
echo "Checking the network status..."
sleep 1
SEARCHIP=$(ifconfig | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n 1)
for a in {1..5}; do
    ping -c 5 $SEARCHIP
    if [ $? -eq 0 ]; then
        echo
        sleep 1
        echo "The network is working correct"
        break
    else
        echo "Please check your Wi-Fi/Ethernet and try another one"
        exit 1
    fi
done

echo
while true; do
    read -p "Write the IP adress you want:" USER_IP
    if [[ "$USER_IP" == *.*.*.* ]]; then
        echo "In progress..."
        sleep 2
        break
    else
        echo "The IP adress is incorrect please try again"
    fi
done

#Find enp0 network interface
INTERFACE=$(ifconfig -s | awk '$NF != "0" && $1 != "Iface" {print $1}' | head -n 1)
sudo ifconfig $INTERFACE $USER_IP
echo "The IP adress succesfully changed to $USER_IP"
for ((i=0; i<20; i++));do
    echo -n "="
done
echo
echo "Have a nice day $USER!"
}

#The beginning of the script
echo "Welcome to the SIP script $USER"
for ((i=0; i<20; i++)); do
    echo -n '='
done
echo
read -p "Are you sure you want to change your Ip adress? " USER_ANSWER
if [[ "$USER_ANSWER" = "yes" || "$USER_ANSWER" = "Yes" ]]; then
    echo "First of all i will show your IP adresses"
    sleep 1
    SIP
    exit 0
else
    echo "Have a nice day, Goodbye $USER!"
    exit 0
fi
