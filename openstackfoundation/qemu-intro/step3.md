# Launch the VM

Main command:

`qemu-system-x86_64 -machine type=q35 -m 512 -nographic -drive if=virtio,format=qcow2,file=ubuntu-20.04-server-cloudimg-amd64-disk-kvm.img -drive if=virtio,format=raw,file=seed.img -device virtio-net-pci,netdev=net0,mac=00:a1:b6:7a:ff:eb -netdev tap,ifname=tap0,id=net0,script=no`{{execute}}

The console output of the VM will be sent to stdout.

# SSH to server

On the host, execute:

`ssh ubuntu@192.168.122.140 -i ~/.ssh/id_mykey`{{execute}}
