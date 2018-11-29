#!/bin/bash
#kubenetes repo setting
echo "-------------------------- kube-set.sh"
sudo cat << EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
sudo yum -y install kubeadm-1.12.3-0 kubelet-1.12.3-0 kubectl-1.12.3-0
sudo systemctl enable kubelet.service
sudo systemctl start kubelet.service