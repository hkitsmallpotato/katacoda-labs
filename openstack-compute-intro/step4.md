# SSH into the server

To do this we will need a floating IP association.

## Allocate a floating IP from a pool

First find out what pool we have:

`openstack floating ip pool list`{{execute}}

Then allocate one:

`openstack floating ip create public`{{execute}}

## Association of floating IP

`openstack server add floating ip testvm <ip-addr>`

## SSH into server

`openstack ssh server testvm -- -i ~/.ssh/id_rsa -u cirros`
