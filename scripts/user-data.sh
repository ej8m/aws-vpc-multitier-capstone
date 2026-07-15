#!/bin/bash
# EC2 user data - bootstraps an Apache web server on Amazon Linux 2023
# Used in the launch template (v2) for the Auto Scaling Group
#
# Note: v1 of this script was corrupted by a PDF copy-paste
# ("httpd" became "hFpd" and the shebang was missing the leading "/"),
# which caused instances to launch without Apache and fail ALB health checks.

yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
echo " This is an app server in AWS Region US-EAST-1 " > /var/www/html/index.html
