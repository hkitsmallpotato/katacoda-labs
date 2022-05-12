# Create Volume group

Now create a volume group using the two PVs, grouping them together:

`vgcreate myvg /dev/vdb /dev/vdc`{{execute}}

Check the result:

`vgdisplay myvg`{{execute}}

# Create logical volume

Finally, create logical volume specifying the size we like. We have flexibility in that we can create multiple LVs, and LVM will allocate it from the underlying VG.

`lvcreate --size 5G --name user myvg`{{execute}}
`lvcreate --size 25G --name system myvg`{{execute}}
`lvcreate --size 100M --name bootstrap myvg`{{execute}}

Check the result:

`lvdisplay`{{execute}}

`vgdisplay`{{execute}}
