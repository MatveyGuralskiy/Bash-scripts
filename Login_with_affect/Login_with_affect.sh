#!/bin/bash
#--------------Custom Login Bash Script---------------
#-------------Script by Matvey Guralskiy--------------

LOADING=('-' '\' '|' '/')

function AFFECT() {
    local END_TIME=$((SECONDS + 2))
    while [ $SECONDS -lt $END_TIME ] ; do
        for c in "${LOADING[@]}"; do
            echo -en "\rLogging in... $c "
            sleep 0.5
        done
    done
}

echo "Welcome to Custom Login Bash Script"

for ((i=0; i<30; i++)) ;do
    echo -n "="
done
echo

USERNAME="admin"
PASSWORD="password"
TRIES=0

while true; do
    read -p "Please enter your username: " USER_INPUT
    read -s -p "Please enter your password: " PASS_INPUT
    echo

    echo -e '\nAuthenticating...'
    AFFECT

    if [ "$USER_INPUT" == "$USERNAME" ] && [ "$PASS_INPUT" == "$PASSWORD" ]; then
        echo -e "\nLogin successful!"
        break
    else
        TRIES=$((TRIES+1))
        if [ "$TRIES" -ge 3 ]; then
            echo "You don't have enough tries, exiting the script."
            exit 1
        else
            echo -e "\nInvalid username or password. Please try again.\n"
        fi
    fi
done

echo "Welcome, $USERNAME!\nHave a nice day"
