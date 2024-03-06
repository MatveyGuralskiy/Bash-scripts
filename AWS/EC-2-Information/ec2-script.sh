#!/bin/bash
#--------------VARIABLES-----------------
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
userAMI=`curl http://169.254.169.254/latest/meta-data/ami-id -H "X-aws-ec2-metadata-token: $TOKEN"`
userAddress=`curl http://169.254.169.254/latest/meta-data/public-ipv4 -H "X-aws-ec2-metadata-token: $TOKEN"`
userGroup=`curl http://169.254.169.254/latest/meta-data/security-groups -H "X-aws-ec2-metadata-token: $TOKEN"`
userInstance=`curl http://169.254.169.254/latest/meta-data/instance-id -H "X-aws-ec2-metadata-token: $TOKEN"`
userType=`curl http://169.254.169.254/latest/meta-data/instance-type -H "X-aws-ec2-metadata-token: $TOKEN"`


#-----------------MAIN-------------------
echo "Before the starting of the script please login to AWS"
aws configure
echo "Loading..."
sleep 5
echo "Welcome to the AWS script for showing your information about EC-2 Instances"
echo "Let's start..."
sleep 1
echo "Your Instance AMI id: $userAMI"
echo "Your Public IP address: $userAddress"
echo "Your Instance id: $userInstance"
echo "Your Type of Instance: $userType"
echo "Your Security group (firewall): $userGroup"
echo "Finished"
echo "Have a nice day $USER!"
