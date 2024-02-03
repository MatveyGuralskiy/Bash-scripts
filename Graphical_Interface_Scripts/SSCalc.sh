#!/bin/bash
#---------------SSCalc---------------
#---------Simple Script Calculator---

#SPACE print "=" symbols
function SPACE(){
    for ((i=0; i<30; i++)); do
        echo -n "="
    done
    echo
}

SPACE
echo "Welcome to the SSCALC V1.0"
echo "You can calculate numbers with a lot of operations"
SPACE
sleep 3
OPERATION=$(zenity --list --title="Select Operation" \
                   --column="Operation" "Addition" "Subtraction" \
                   "Multiplication" "Division" "Squared" \
                   "Square Root" --width=300 --height=250)


# Check if the Cancel button was pressed
if [ $? != 0 ]; then
  zenity --error --text="Canceled by user."
  exit 1
fi


#Entering of user's numbers
USERNUM1=$(zenity --entry --title="Enter the first number" \
              --text="Enter the first number:" --entry-text="0")
USERNUM2=$(zenity --entry --title="Enter the second number" \
              --text="Enter the second number:" --entry-text="0")


# Check if the Cancel button was pressed or if input is empty
if [ -z "$USERNUM1" ] || [ -z "$USERNUM2" ]; then
  zenity --error --text="Canceled by user..."
  exit 1
fi


#----------------CONFIGURATIONS OF OPERATIONS---------------
case $OPERATION in
  "Addition") RESULT=$(($USERNUM1 + $USERNUM2));;
  "Subtraction") RESULT=$(($USERNUM1 - $USERNUM2));;
  "Multiplication") RESULT=$(($USERNUM1 * $USERNUM2));;
  "Division")
    if [ $USERNUM2 -eq 0 ]; then
      zenity --error --text="Division by zero is not allowed..."
      exit 1
    fi
    RESULT=$(echo "scale=2; $USERNUM1 / $USERNUM2" | bc);;
  "Squared") RESULT=$((($USERNUM1+$USERNUM2)*($USERNUM1+$USERNUM2)));;
  "Square Root")
    if [ $USERNUM1 -lt 0 ]; then
      zenity --error --text="Square root of a negative number is undefined..."
      exit 1
    fi
    RESULT=$(echo "scale=2; sqrt($USERNUM1+$USERNUM2)" | bc);;
  *)
    zenity --error --text="Invalid operation."
    exit 1;;
esac


#-------------------RESULT------------------------
zenity --info --title="SSCalc" --text="Result: $RESULT"
