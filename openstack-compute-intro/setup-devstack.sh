#!/bin/sh

set -e

mkswap /swap.img && swapon /swap.img

apt-get update
DEBIAN_FRONTEND=noninteractive \
  apt-get \
  -o Dpkg::Options::=--force-confold \
  -o Dpkg::Options::=--force-confdef \
  -y --allow-downgrades --allow-remove-essential --allow-change-held-packages \
  upgrade || true
apt-get -y dist-upgrade || true

sudo useradd -s /bin/bash -d /opt/stack -m stack
echo "stack ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/stack

cp ~/tcat.sh /opt/stack/
cp ~/local.conf /opt/stack/
chown stack /opt/stack/*
chmod 755 /opt/stack/tcat.sh

su - stack <<EOF
git clone https://git.openstack.org/openstack-dev/devstack

export LOCAL_IP=`ip -j -4 a show ens3 | jq .[].addr_info[].local`

./tcat.sh local.conf > ./devstack/local.conf

echo "===== Content of local.conf ====="
cat ./devstack/local.conf
echo "===== Prepare to install devstack in 3 seconds ====="

sleep 3 && cd devstack/ && ./stack.sh
EOF
