#!/usr/bin/env bash
sudo apt-get -y install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get -y install ansible

cp -rvf /vagrant/ansible-repo /home/vagrant/
chown -R vagrant.vagrant /home/vagrant/ansible-repo/
ansible --version

cat >> /etc/hosts << EOL
10.0.0.10  ansible-mgmt
10.0.0.16  elb-haproxy1
10.0.0.17  elb-haproxy2
10.0.0.32  webnode1
10.0.0.33  webnode2
10.0.0.34  webnode3
10.0.0.35  webnode4
EOL
echo""
echo""
echo""
echo""
echo""
echo "Adding all registered node to ..shs/known_hosts file....MIKEMIKE"
ssh-keyscan elb-haproxy1 elb-haproxy2 webnode1 webnode2 webnode3 webnode4  >> /home/vagrant/.ssh/known_hosts
chown -R vagrant.vagrant /home/vagrant/.ssh/ 
echo "          #       #            "
echo "###############################"
echo "# MIKE ANSIBLE SERVER#"
echo "###############################"
echo "  #####    COMPLETE     #####"
echo "    #                     #

