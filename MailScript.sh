#!/bin/bash
PINCODE=1234
ATTEMPTS=3
echo "Welcome to Mail Script, this script only for superuser permissions"

for ((i=1; i<=$ATTEMPTS; i++)); do
    read -s -p "Please enter the PIN code: ($i/$ATTEMPTS): " USER_PINCODE
    echo
    if [ "$USER_PINCODE" = "$PINCODE" ]; then
        echo "PIN code is right, welcome back!"

SSMTP_CONF="/etc/ssmtp/ssmtp.conf"

SMTP_SERVER=$(awk '/^mailhub/{print $2}' $SSMTP_CONF)
SMTP_PORT=$(awk '/^mailhub/{print $3}' $SSMTP_CONF)
USERNAME=$(awk '/^AuthUser/{print $2}' $SSMTP_CONF)
PASSWORD=$(awk '/^AuthPass/{print $2}' $SSMTP_CONF)

        read -p "What the email you want to send a message/letter: " RECIPIENT
        read -p "Print Here your subject: " SUBJECT
        read -p "Enter your text: " BODY

        echo ""
        mail_content="Subject: $SUBJECT"
        mail_content+="\n$BODY"

        if echo -e "$mail_content" | ssmtp $RECIPIENT; then
            echo "The message was send..."
        else
            echo "Error, try again please"
        fi
        exit 0
    else
        echo "Try another one, you have $ATTEMPTS"
    fi
done

exit 1
