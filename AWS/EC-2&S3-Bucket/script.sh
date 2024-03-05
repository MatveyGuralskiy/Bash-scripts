#!/bin/bash
echo "Starting automatically script"
yum -y update
yum -y install httpd
aws s3 sync s3://(BUCKET NAME) /var/www/html
service httpd start
chkconfig httpd on
echo "Finished successfully"