#!/bin/bash
#epel7 repo setting
echo "-------------------------- repo-set.sh"
sudo yum -y install firewalld  systemd-resolved telnet wget
sudo wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo rpm -ivh epel-release-latest-7.noarch.rpm