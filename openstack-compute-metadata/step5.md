# Examining metadata

Once we are inside the VM, we can examine what metadata is avilable to us.

There are two methods:

- Direct check by calling the EC2 compatible API manually
- Using the `cloud-init` command line tool

## Manual Examination

To do this we run:

`curl http://169.254.169.254`{{execute}}

Note that it should return a list of directories. You should transverse it as you discover it by appending to the URL, e.g. `http://169.254.169.254/openstack/2018-08-27`.

The current version is at `v1` folder.

## Using command line tool

Reference: https://cloudinit.readthedocs.io/en/latest/topics/instancedata.html

Run

`cloud-init query --list-keys`{{execute}}

to list all keys.

Query specific parameters:

`sudo cloud-init query ds`{{execute}}

(Note the use of `sudo` as otherwise we won't be able to see sensitive data)

As preparation for developing and debugging our `cloud-init` scripts, we can run:

`cloud-init query --format 'cloud: {{ v1.cloud_name }} myregion: {{ v1.region }}'`{{execute}}

To see what a jinja template will render into after substitution by parameters from the metadata service.

## Other reference

https://stackoverflow.com/questions/41942469/openstackcli-access-propertys-from-cloudinit-script
