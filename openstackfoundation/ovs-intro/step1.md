# Background

OpenVSwitch (OVS) is technology for *Software Defined Networking* (SDN).

## Comparison with Linux Bridge

While both OVS and Linux Bridge can provide similar functionalities, both their mechanism, design, and tradeoffs are different.

- OVS is dedicated to SDN and have a separate module for policy (*what* should we do to the packet/flows) and mechanism (*how* to execute the intention). Linux Bridge is built-in to the kernel and has the primary responsibility to provide networking capability to the OS. As such while programmability is a plus it is not something to pursue at any cost.
- OVS is more flexible/powerful in programmability - in the extreme it can interface with user provided program to let user have complete control. Linux bridge is somewhat more limited in this regard.
- On the other hand, Linux Bridge enjoy the built-in advantage (natural integration with the rest of the system), and is simpler/easier to grasp/have less setup required.

### Differing Mechanism

Linux Bridge is integrated as part of the Linux Networking Stack itself - it is free to call kernel functions (and get called by the networking stack as part of packet processing), and in effect simulate a switch in software.

OVS have two mechanism - one with a small *kernel module* to execute the actions, and another *purely userspace* one for user who do not have sufficient privilege on the target system. For the kernel module, it also gets to call the relevant kernel functions. However the difference is that all intermediate processing happen within the OVS system and not in kernel. For example if the flow passes through a *vport* (OVS analogue of veth-pair?), then the control decisions are made within OVS and only when the packet finally leaves OVS at some output vport, do kernel functions get called. Hence if one tries to do a packet capture in the middle, one wouldn't see anything.

# Reference

https://docs.openvswitch.org/en/latest/tutorials/ovs-advanced/
https://docs.openvswitch.org/en/latest/topics/datapath/
https://arthurchiao.art/blog/ovs-deep-dive-4-patch-port/
https://www.fiber-optic-transceiver-module.com/ovs-vs-linux-bridge-who-is-the-winner.html

