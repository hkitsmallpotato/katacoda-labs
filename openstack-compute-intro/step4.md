# SSH into the server

To do this we will need a floating IP association.

## Allocate a floating IP from a pool

First find out what pool we have:

`openstack floating ip pool list`{{execute}}

Then allocate one:

`openstack floating ip create public`{{execute}}

Note down the IP address.

## Association of floating IP

`openstack server add floating ip testvm <ip-addr>`

## Allow SSH connection by adding Security Group Rule

Our VM is associated with the `default` Security Group, which do not allow inbound connection from outside the subnet. We must explicitly authorize an exception by adding a rule to the security group.

`openstack security group rule create --remote-ip 0.0.0.0/0 --dst-port 22 --protocol tcp --ingress default`{{execute}}

## SSH into server

`openstack server ssh testvm -- -i ~/.ssh/id_rsa -l cirros`{{execute}}
