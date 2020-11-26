#!/bin/bash

# Install nginx
sudo apt update
sudo apt install nginx

# Enable firewall rules
sudo ufw allow Nginx HTTP
sudo ufw allow OpenSSH
sudo ufw enable

# Confirm ufw rules enabled
sudo ufw status | grep "Status: active"
enabled=$?

if [[ $enabled -eq "0" ]]; then
    echo "firewall not properly set";
    exit
fi

sudo systemctl status nginx | grep "Active: active"
running=$?

if [[ $enabled -eq "0" ]]; then
    echo "nginx not running"
fi

cp nginx.conf /etc/nginx/nginx.conf
