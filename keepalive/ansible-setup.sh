#!/usr/bin/env bash
sudo apt-get -y install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get -y install ansible

cp -rvf /vagrant/ /home/vagrant/
chown -R vagrant.vagrant /home/vagrant/
ansible --version

cat >> /etc/hosts << EOL
10.0.0.10  ansible-mgmt
10.0.0.16  haproxy1
10.0.0.17  haproxy2
EOL

echo""
echo""
echo""
echo""
echo""
echo "Adding all registered node to ..shs/known_hosts file....MIKEMIKE"
ssh-keyscan haproxy1 haproxy2  >> /home/vagrant/.ssh/known_hosts
chown -R vagrant.vagrant /home/vagrant/.ssh/ 
echo "          #       #            "
echo "###############################"
echo "# MIKE ANSIBLE SERVER#"
echo "###############################"
echo "  #####    COMPLETE     #####"
echo "    #                     #

