#!/bin/bash
# Bootstraping of EFS
yum update -y
yum install -y amazon-efs-utils
mkdir efs_disk
mount -t efs YOUR_EFS_ID:/ /efs_disk
echo "YOUR_EFS_ID:/ /efs_disk efs defaults,_netdev 0 0" >> /etc/fstab