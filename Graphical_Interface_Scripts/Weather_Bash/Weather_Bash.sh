#!/bin/bash
#---------------WEATHER BASH SCRIPT-------------------
echo "Welcome to Weather Bash script..."
echo "This script will show you the weather"
for ((i=0; i<30; i++)); do
    echo -n "="
done
sleep 2
#----Zenity first window to entry Country and City---
USER_ASK=$(zenity --entry --title="Weather Bash" --text="Enter the country and city you want to check the weather: " 2>/dev/null)

#-------------------Canceled buttom------------------
if [ $? != 0 ] || [ -z "$USER_ASK" ]; then
  zenity --error --text="Canceled by user or empty input."
  exit 1
fi

#---------Shows Weather data with curl---------------
RESULT=$(curl -s wttr.in/$USER_ASK?format=%t)

if [ $? != 0 ]; then
  zenity --error --text="Failed to fetch weather data. Make sure 'curl' is installed and your internet connection is active."
  exit 1
fi

zenity --list --title="Result" --text="Result is:" --column="Weather" "$RESULT"
