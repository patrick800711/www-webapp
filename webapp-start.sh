#!/bin/bash
sudo iptables -F
sudo iptables -A INPUT -p tcp -m tcp --sport 80 -j ACCEPT
sudo iptables -A OUTPUT -p tcp -m tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp -m tcp --sport 443 -j ACCEPT
sudo iptables -A OUTPUT -p tcp -m tcp --dport 443 -j ACCEPT
sudo systemctl start nginx.service
sudo gunicorn --workers=2 --chdir /home/admin/python-webapp main:app
