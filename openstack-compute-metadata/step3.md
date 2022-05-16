# Launch a Server

TODO: Convert steps already covered in the last lab into a script so we can focus on the new stuff.

Here we show a simplified test case.

## Download cloud image

We will use the ubuntu cloud image. Download it:

`wget https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64-disk-kvm.img`{{execute}}

## Genrate and upload ssh key

`ssh-keygen -t rsa -b 4096`{{execute}}

Use the default path `/opt/stack/.ssh/id_rsa`. (This is okay as it is a new user, so there is no key yet)

Now upload our key:

`openstack keypair create --public-key ~/.ssh/id_rsa.pub stack_ident`{{execute}}

## Check network, image, and flavor

`openstack network list`{{execute}}

`openstack image list`{{execute}}

`openstack flavor list`{{execute}}

## Upload image

`openstack image create --container-format bare --disk-format qcow2 --file ubuntu-20.04-server-cloudimg-amd64-disk-kvm.img my-ubuntu`{{execute}}

## Create volume

`openstack volume create --size 5 --image my-ubuntu --bootable --type lvmdriver-1 myvol`{{execute}}

`openstack volume list`{{execute}}

## Create server

`openstack server create --flavor m1.tiny --volume myvol --key-name stack_ident --network private --property foo=bar --property test=true testvm`{{execute}}

(Note the `--property foo=bar` argument. We can specify multiple such metadata by repeating the flag)

Check the progress:

`openstack server list`{{execute}}

### Tips:

It is recommended to check the log live to spot any potential errors. Latest Openstack have switched to using Linux's built-in logging facility, so we can just:

`journalctl -f -u devstack@n-*`{{execute}}

(`-f` for follow/tail, `-u` means unit, and `n-*` matches all unit name with prefix `n-`, which will catch all nova(compute) related services)
