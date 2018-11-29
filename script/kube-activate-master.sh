#!/bin/sh
echo "---------------------------------- activate master"
whoami
sudo swapoff -a
sudo sed -i.bak '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
sudo kubeadm init --apiserver-advertise-address=192.168.55.11 --pod-network-cidr 192.168.0.0/16 > ~/kubeadm-result.txt
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml
kubectl taint nodes --all node-role.kubernetes.io/master-
sed -i "s/^\\s*kubeadm/kubeadm/" kubeadm-result.txt; echo '#!/bin/sh' > join-me.sh; cat kubeadm-result.txt|grep 'kubeadm join' >> join-me.sh
chmod u+x join-me.sh
