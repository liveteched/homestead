#!/bin/sh

# If you would like to do some extra provisioning you may
# add any commands you wish to this file and they will
# be run after the Homestead machine is provisioned.

yes | sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.8

python3.8 -m pip install -U pip
pip install crash

sudo cp /home/vagrant/nginx-configs/admin.sauron.test /etc/nginx/sites-available/admin.sauron.test
sudo cp /home/vagrant/nginx-configs/qevin.test /etc/nginx/sites-available/qevin.test
sudo cp /home/vagrant/nginx-configs/arcade.test /etc/nginx/sites-available/arcade.test

sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt update
sudo apt install -y openjdk-11-jre-headless

wget https://cdn.crate.io/downloads/deb/DEB-GPG-KEY-crate
sudo apt-key add DEB-GPG-KEY-crate
sudo add-apt-repository "deb https://cdn.crate.io/downloads/deb/stable/ $(lsb_release -cs) main"
sudo apt update
sudo apt install crate