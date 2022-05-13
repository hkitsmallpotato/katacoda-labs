# Preliminaries

## Install softwares

First install all packages needed in this lab:

`apt install qemu-system-x86 cloud-image-utils mlocate`{{execute}}

## Preparing files

First generate our ssh keys:

`ssh-keygen`{{execute}}

Follow the instructions and provide your own path distinct from the existing `id_rsa` file.

Open the public key file (the one with suffix `.pub`) for use later.

We have prepared two files `metadata.yaml` and `user-data.yaml` for you.

Open and examine them, and paste/override with the ssh public key you generated.

Generate a seed image with this command:

`cloud-localds seed.img user-data.yaml metadata.yaml`{{execute}}

Also, download the cloud image of ubuntu:

`wget https://cloud-images.ubuntu.com/releases/focal/release/ubuntu-20.04-server-cloudimg-amd64-disk-kvm.img`{{execute}}
