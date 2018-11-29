#!/bin/bash
echo "-------------------------- sysctl-set.sh"
sudo modprobe overlay
sudo modprobe br_netfilter
sudo modprobe ip_vs
sudo modprobe ip_vs_rr
sudo modprobe ip_vs_wrr
sudo modprobe ip_vs_sh
sudo modprobe nf_conntrack_ipv4
sudo sysctl fs.inotify.max_user_watches=524288
sudo sysctl net.bridge.bridge-nf-call-iptables=1
sudo sysctl net.ipv4.ip_forward=1
sudo sysctl net.bridge.bridge-nf-call-ip6tables=1
sudo sysctl -p
sudo cat << EOF >> /etc/sysctl.conf
fs.inotify.max_user_watches=524288
net.bridge.bridge-nf-call-iptables=1
net.ipv4.ip_forward=1
net.bridge.bridge-nf-call-ip6tables=1
EOF