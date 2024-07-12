#!/bin/bash
apt-get update
apt-get install nginx -y
echo "echo $(hostname -f)" >/var/www/html/index.nginx-debian.html