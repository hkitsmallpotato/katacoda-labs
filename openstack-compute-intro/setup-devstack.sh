#!/bin/sh

mkswap /swap.img && swapon /swap.img

sudo apt update
sudo apt -y upgrade
sudo apt -y dist-upgrade

sudo useradd -s /bin/bash -d /opt/stack -m stack
echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack

cp ~/tcat.sh /opt/stack/
cp ~/local.conf /opt/stack/
chown stack /opt/stack/*
chmod 755 /opt/stack/tcat.sh

su - stack
git clone https://git.openstack.org/openstack-dev/devstack

export LOCAL_IP=`ip -j -4 a show ens3 | jq .[].addr_info[].local`

./tcat.sh local.conf > ./devstack/local.conf

cd devstack/ && ./stack.sh
