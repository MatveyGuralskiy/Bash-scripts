#!/bin/bash
echo "Starting automatically script"
yum -y update
yum -y install httpd
echo "<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>AWS EC-2 Bootstrapping</title></head><body><h1>AWS EC-2 Bootstrapping</h1><p>Created by Matvey Guralskiy</p><style>h1 {font-size: 50px;font-family: monospace;}body {background-color: bisque;}p {font-size: 25px;font-family: monospace}</style></body></html>" > /var/www/html/index.html
service httpd start
chkconfig httpd on
cat error.txt
echo "UserData executed on $(data)" >> /var/www/html/log.txt
echo "Finished successfully"