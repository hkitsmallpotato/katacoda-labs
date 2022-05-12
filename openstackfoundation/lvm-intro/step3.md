# Format the LV

Before using them, we need to format it.

`mkfs.ext4 /dev/myvg/user`{{execute}}
`mkfs.ext4 /dev/myvg/system`{{execute}}
`mkfs.ext4 /dev/myvg/bootstrap`{{execute}}

# Mount the filesystem

`mkdir -vp /mnt/test/{user,system,bootstrap}`{{execute}}

`mount /dev/myvg/user /mnt/test/user`{{execute}}
`mount /dev/myvg/system /mnt/test/system`{{execute}}
`mount /dev/myvg/bootstrap /mnt/test/bootstrap`{{execute}}

# Final reesult

Check the filesystem and block devices again:

`df -h`{{execute}}
`lsblk`{{execute}}

Download some test files:

`cd /mnt/test/user && wget https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64.img`{{execute}}
