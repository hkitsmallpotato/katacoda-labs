# Launch the VM

Main command:

`qemu-system-x86_64 -machine type=q35 -m 512 -nographic -drive if=virtio,format=qcow2,file=ubuntu-20.04-server-cloudimg-amd64-disk-kvm.img -drive if=virtio,format=raw,file=seed.img -net bridge,br=virbr0 -net nic,model=virtio`{{execute}}

