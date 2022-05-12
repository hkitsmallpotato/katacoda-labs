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
