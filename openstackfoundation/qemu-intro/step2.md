# Bridged Networking mode

There are many different ways to configure networking for qemu. In this lab we will use bridged networking - we need to supply a linux bridge ourselves, and qemu will attach a tap device to it.

## Create a linux bridge

`ip link add name virbr0 type bridge`{{execute}}

`ip link set virbr0 up`{{execute}}

**Warning: Do NOT attach the bridge to your main interface as this will disconnect you from the machine! We will rely on L3 routing instead.**

## Setup Permission for QEMU to access the bridge

`mkdir /etc/qemu`{{execute}}

`touch /etc/qemu/bridge.conf`{{execute}}

`chmod u+r /etc/qemu/bridge.conf`{{execute}}

`echo "allow virbr0" > /etc/qemu/bridge.conf`{{execute}}

`chmod u+s $(locate -r /usr/.*/qemu-bridge-helper$)`{{execute}}
