#!/bin/sh

set -e

rm /swap.img

mkdir /mnt/data
mkfs.ext4 /dev/vdd
mount /dev/vdd /mnt/data
dd if=/dev/zero of=/mnt/data/swap.img bs=1024 count=5120000
mkswap /mnt/data/swap.img && swapon /mnt/data/swap.img

pvcreate /dev/vdb
pvcreate /dev/vdc
vgcreate stack-volumes /dev/vdb /dev/vdc

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
cp ~/myvar /opt/stack/
chown stack /opt/stack/*
chmod 755 /opt/stack/tcat.sh

su - stack <<EOF
git clone https://git.openstack.org/openstack-dev/devstack

export LOCAL_IP=`ip -j -4 a show ens3 | jq .[].addr_info[].local`

set -a
source myvar
set +a
./tcat.sh local.conf > ./devstack/local.conf

echo "===== Content of local.conf ====="
cat ./devstack/local.conf
echo "===== Prepare to install devstack in 3 seconds ====="

sleep 3 && cd devstack/ && ./stack.sh
EOF
