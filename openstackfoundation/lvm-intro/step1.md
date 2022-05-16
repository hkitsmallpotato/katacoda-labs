# (Optional) Setup emulation enviornment using loopback interface

If the system you're on does not have multiple physical disks, then you can still do this lab by emulating those using *loopback devices*.

Reference: https://ops.tips/blog/lvm-on-loopback-devices/

First check which loopbacks are in use:

`df -h`{{execute}}

`lsblk`{{execute}}

`ls /dev | grep loop`{{execute}}

Now create a backing file that will hold the data for the emulated disk:

`dd if=/dev/zero of=./lvm0.img bs=50 count=1M`{{execute}}

Then link the file to the loopback (for this and following commands, replace `loop0` with an empty slot):

`losetup /dev/loop0 ./lvm0.img`

Then format the disk:

`echo ",,8e,," | sfdisk /dev/loop0`

And finally update the partition table:

`partx --update /dev/loop0`

You may now continue with this lab. One caveat is that you need to use small values for the logical volumes as the backing file is only 50MB.

# Check available block devices

To show our current filesystem status:

`df -h`{{execute}}

To show the block devices:

`fdisk -l`{{execute}}
`lsblk`{{execute}}

# Create a physical volume

First check what LVM volumes we have:

`lvmdiskscan -l`{{execute}}

Now let's create two physical volumes using the unused disk:

`pvcreate /dev/vdb`{{execute}}
`pvcreate /dev/vdc`{{execute}}

Check the results:

`lvmdiskscan -l`{{execute}}

`pvdisplay`{{execute}}
