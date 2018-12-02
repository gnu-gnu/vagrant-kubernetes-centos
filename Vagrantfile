$host_name = <<-SCRIPT
echo "127.0.0.1 localhost" > /etc/hosts
echo "192.168.55.11 master" >> /etc/hosts
echo "192.168.55.12 worker1" >> /etc/hosts
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.define "master" do |master|
    master.vm.hostname = "master"
    master.ssh.port = 9922
    master.ssh.guest_port = 22
    master.vm.network "public_network", ip: "192.168.55.11", bridge: "eth0"
    # id: 'ssh' override default ssh forwarded_port 2222 -> 22
    master.vm.network "forwarded_port", guest: 22, host: 9922, id: 'ssh'
    master.vm.network "forwarded_port", guest: 80, host: 8080
    master.vm.provision "shell", path: "./script/kube-activate-master.sh",privileged: false
  end
  
  config.vm.define "worker1" do |worker1|
    worker1.vm.hostname = "worker1"
    worker1.ssh.port = 9923
    worker1.ssh.guest_port = 22
    worker1.vm.network "public_network", ip: "192.168.55.12", bridge: "eth0"
    # id: 'ssh' override default ssh forwarded_port 2222 -> 22
    worker1.vm.network "forwarded_port", guest: 22, host: 9923, id: 'ssh'
    worker1.vm.provision "shell", path: "./script/kube-join-node.sh"
  end  

  # Virtual machine system
  config.vm.box = "centos/7"
  config.vm.provider "virtualbox" do |v|
    v.memory = 3072
    v.cpus = 1
  end

  # sync files and setting docker, kubernetes, system environment...
  config.vm.provision "file", source: './keys/public.key', destination: "/home/vagrant/.ssh/authorized_keys"
  config.vm.provision "file", source: './tmp', destination: "/tmp"
  config.vm.provision "shell", inline: $host_name
  config.vm.provision "shell", path: "./script/repo-set.sh"  
  config.vm.provision "shell", path: "./script/sysctl-set.sh"
  config.vm.provision "shell", path: "./script/firewall-set.sh"
  config.vm.provision "shell", path: "./script/docker-set.sh"
  config.vm.provision "shell", path: "./script/kube-set.sh"
end