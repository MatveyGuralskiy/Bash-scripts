This script will send massages to email you want, it works with SMTP and send emails from gmail profile
First of all install smtp to your computer/server:
sudo apt-get install ssmtp
After that open your google profile and click to the "manage your Google Account"
Your have to do 2 step verification
Now you can add your app security password , click to the search window and enter app, now create the name of your password and save them (You have to used him instead the usual password of your gmail)
P.S. You must to open the script with sudo permissions (sudo ./MailScript.sh)
All settings of smtp located in file /etc/ssmtp/ssmtp.conf (You should be a sudo user to edit him)
root=#Your gmail
mailhub=smtp.gmail.com:587
rewriteDomain=gmail.com
AuthUser=#Your gmail
AuthPass=#Your app password
FromLineOverride=YES
UseSTARTTLS=YES
