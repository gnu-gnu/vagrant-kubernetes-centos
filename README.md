# Kubernetes with Vagrant
* Kubernetes environment with Vagrant(virtual box)
* This environment consists of 1 master node and 1 worker node
* based on CENTOS7 and docker 18.06 and kubernetes 1.12.3
* it uses calico
## requirements
* vagrant 2+ (tested on 2.1.1)
* virtualbox 5+ (tested on 5.2.8)
## instruction
* install vagrant and virtualbox
* 'vagrant up' in Vagrantfile placed directory
* master's SSH port is 9922, worker's SSH port is 9923
* authentication uses username 'vagrant' and private-key is on './keys/private.ppk' (putty key) 
* if you want another clients then make own your key with ./keys/private.key
* after all tasks complete, check 'kubectl get nodes' in VM
## note
* Sometimes error occurs during kubernetes initialize. when you face such a problem, see console display of 'vagrant up' and check what step causes failure then re-run set scripts
* './script' directory has shell script files below
* common scripts
  * repo-set.sh : initialize yum repositories and install firewalld, systemd-resolved, telnet, wget
  * sysctl-sh : mod setting, modify system attributes(like max_user_watches, ip_forward etc..)
  * firewall-set.sh : start firewalld daemon and open firewall
  * docker-set.sh : install docker and start docker.service
  * kube-set.sh : install kubeadm, kubelet, kubectl and start kubelet.service
* master node
  * kube-activate-master.sh : setup kubernetes and pod-networks (result will be written at ~/kubeadm-result.txt), apply RBAC and calico, untaint master node. it creates join-me.sh at /home/vagrant
* worker node
  * kube-join-node.sh : pull join-me.sh from master-node and execute. then worker-node tries to join cluster
