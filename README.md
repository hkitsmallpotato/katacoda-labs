# katacoda-labs

Unfortunately, katacoda have just announced that they will shut down the free service ([link](https://www.oreilly.com/online-learning/leveraging-katacoda-technology.html)), so this is more for reference now.

As an alternative, I'm investigating [killercoda](https://killercoda.com/). Note however that the current scenarios are using specific features in katacoda and so won't work directly without modification.

In particular:
- Katacoda have a disk space of 20GB, and have 3 backup disks that can be mounted. This turns out to be critical in making the advanced use case of doing an Openstack lab (using devstack) possible, which is a surprise to me.
  - Details: The main disk is used by devstack for installation + emphemeral disk for Nova VM instance + during disk image conversion process.
  - We manually convert disk 2 and 3 into LVM's volume group (`stack-volumes`) that are then used as the backing store for both Cinder (Block Storage) and Glance (Image service).
  - Disk 4 is used as swap space as 1.5GB ram simply isn't enough. With 5GB swap we can support a 512MB VM safely. (4GB also work, but is dangerously close to the edge of OOM)
- I used the various [special layout](https://www.katacoda.community/essentials/layouts.html) supported by katacoda.

In the long term though, I think there need to be a separation of content from infrastructure so that some kind of provider independence can be achieved. (E.g. if user is willing, can provision it on their own infra/at their cost in an automated manner)

## Link to the lab

- [Katacoda](https://katacoda.com/hkitsmallpotato)
- [Killercoda](https://killercoda.com/hkitsmallpotato)

## Status of the labs

- Foundation of Cloud Computing for Openstack
  - Intro to QEMU (Done except figuring out how to do NAT)
  - QEMU Image (Only a sketch. But the commands are what I use in my home computer and mostly tested. Just need to disable graphics)
  - Intro to LVM (Done)
  - Intro to OpenVSwitch (Placeholder only with background text)
  - Implementing Openstack Network Model (Placeholder only with background text and references)
- Openstack Lab Series
  - Compute Service in Openstack (Manually tested and work in some previous version of the lab, though the details may have drifted)
  - Metadata and cloud-init for Openstack Compute (Can boot cloud ubuntu, login, and use the `cloud-init` program. Still need to figure out where Openstack metadata/property can be retrieved inside the instance)
  - Types of Openstack Network (Placeholder only with background text and reference)
  - Virtual Network in Openstack (TODO)
