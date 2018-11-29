#!/bin/bash
#ports below fulfill calico's requirement
#see https://github.com/coreos/coreos-kubernetes/blob/master/Documentation/kubernetes-networking.md
#see https://docs.projectcalico.org/master/getting-started/kubernetes/requirements
echo "-------------------------- firewall-set.sh"
systemctl enable firewalld
systemctl start firewalld
systemctl enable systemd-resolved
systemctl start systemd-resolved  
firewall-cmd --permanent --zone=public --add-port=179/tcp
firewall-cmd --permanent --zone=public --add-port=5473/tcp
firewall-cmd --permanent --zone=public --add-port=4789/udp
firewall-cmd --permanent --zone=public --add-port=443/tcp
firewall-cmd --permanent --zone=public --add-port=6443/tcp
firewall-cmd --permanent --zone=public --add-port=8080/tcp
firewall-cmd --permanent --zone=public --add-port=2379-2380/tcp
firewall-cmd --permanent --zone=public --add-port=10250-10255/tcp
firewall-cmd --permanent --zone=public --add-port=30000-32767/tcp
firewall-cmd --reload