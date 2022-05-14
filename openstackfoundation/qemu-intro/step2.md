# Bridged Networking mode

There are many different ways to configure networking for qemu. In this lab we will use bridged networking - we need to supply a linux bridge ourselves, and qemu will attach a tap device to it.

## Create a linux bridge and tap device

We will now do everything manually. First setup the bridge and tap device:

`ip link add name br0 type bridge`{{execute}}

`ip link set br0 up`{{execute}}

**Warning: Do NOT attach the bridge to your main interface as this will disconnect you from the machine! We will rely on L3 routing instead.**

`ip tuntap tap0 mode tap`{{execute}}

`ip link set tap0 up`{{execute}}

`ip link set tap0 master br0`{{execute}}

Then assign a private/local IP subnet to the bridge:

`ip addr add 192.168.122.0/24 br 192.168.122.255 dev br0`{{execute}}

## Run lightweight combined DHCP/DNS server

`dnsmasq` is a combined lightweight server suitable for this purpose. We need all these network service so that the VM can bootstrap itself (esp. the networking stack) properly.

`dnsmasq --interface=br0 --bind-interfaces --dhcp-range=192.168.122.0,192.168.122.255 --dhcp-host=00:a1:b6:7a:ff:eb,192.168.122.140,infinite`{{execute}}

