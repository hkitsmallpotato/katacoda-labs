# Launch a Server

Here we show a simplified test case.

## Genrate and upload ssh key

`ssh-keygen -t rsa -b 4096`{{execute}}

Use the path `/opt/stack/.ssh/id_rsa`.

Now upload our key:

`openstack keypair create --public-key ~/.ssh/id_rsa.pub stack_ident`{{execute}}

## Check network and image

`openstack network list`{{execute}}

`openstack image list`{{execute}}

## Create server

`openstack server create --flavor m1.tiny --image cirros --key-name stack_ident --nic private testvm`{{execute}}

Check the progress:

`openstack server list`{{execute}}
