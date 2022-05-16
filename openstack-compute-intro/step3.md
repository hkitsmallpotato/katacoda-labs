# Launch a Server

Here we show a simplified test case.

## Genrate and upload ssh key

`ssh-keygen -t rsa -b 4096`{{execute}}

Use the default path `/opt/stack/.ssh/id_rsa`. (This is okay as it is a new user, so there is no key yet)

Now upload our key:

`openstack keypair create --public-key ~/.ssh/id_rsa.pub stack_ident`{{execute}}

## Check network, image, and flavor

`openstack network list`{{execute}}

`openstack image list`{{execute}}

`openstack flavor list`{{execute}}

## Create server

`openstack server create --flavor m1.tiny --image cirros --key-name stack_ident --network private testvm`{{execute}}

Check the progress:

`openstack server list`{{execute}}

### Tips:

It is recommended to check the log live to spot any potential errors. Latest Openstack have switched to using Linux's built-in logging facility, so we can just:

`journalctl -f -u devstack@n-*`{{execute}}

(`-f` for follow/tail, `-u` means unit, and `n-*` matches all unit name with prefix `n-`, which will catch all nova(compute) related services)
