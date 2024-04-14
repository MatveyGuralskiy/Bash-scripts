#!/bin/bash
echo "Welcome to simple Installer for different types of Linux"
read -p "Please enter the application you want install on your PC: " USER_APP
read -p "Please enter your Linux Operation System: " USER_OS
if [ $USER_OS == "Ubuntu" ] || [ $USER_OS == "Debian" ]; then
    sudo apt-get install $USER_APP
elif [ $USER_OS == "RedHat" ] || [ $USER_OS == "CentOS" ]; then
    sudo yum install $USER_APP
else
    echo "Simple Installator doesn't work with this OS Family"
fi

