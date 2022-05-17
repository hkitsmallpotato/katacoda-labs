# QEMU Image Tool

`qemu-img` is a utility that can create, convert, examine image, as well as create snapshots.

## Create an empty image

`qemu-img create -f qcow2 ubuntu-20-server-base.qcow2 3G`{{execute}}

`qemu-img info ubuntu-20-server-base.qcow2`{{execute}}

## Install OS using CD image

`qemu-system-x86_64 -hda ubuntu-20-server-base.qcow2 -cdrom ubuntu-20.04.4-live-server-amd64.iso -m 512M -vga virtio`{{execute}}

## Create overlay image

`qemu-img create -f qcow2 -b ubuntu-20-server-base.qcow2 my-ubuntu1.qcow2 -F qcow2`{{execute}}

Here `-f` and `-F` are the input and output file formats, `-b` is the base image, and the main argument is the output filename.

Examine the new image file:

`qemu-img info my-ubuntu1.qcow2`{{execute}}

Notice how it has a small size as it rely on the backing image.

You can now launch the VM again with this derived image alone.
