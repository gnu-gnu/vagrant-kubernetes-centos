#!/bin/sh
swapoff -a
scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i /vagrant/keys/private.key vagrant@192.168.55.11:/home/vagrant/join-me.sh ~/
chmod u+x ~/join-me.sh
~/join-me.sh