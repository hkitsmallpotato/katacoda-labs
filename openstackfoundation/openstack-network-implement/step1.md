
Note: this one is the most ambitious lab by all - I'm still figuring out how much effort is needed to develop this one.

# Comparison with Kubernetes Networking Model

While similar in some respect, they are different in the details due to their different context and design consideration:

- Kubernetes is a "closed" network model - as its target user is application developer, it wants to be opinionated and provide a nice, standardized network model that is intuitive and behave well. It does not need to tackle with the "external world" except through controlled means such as ingress, port-forwarding, and integration with Cloud Load Balancer.
- In contrast, Openstack is a framework *for the cloud builder*. While it has a basic model, it is only intended to be a starting point and not the be-all end-all. Indeed, Openstack is a large, umbralla project with participation and hence stake from numerous vendors. There are many plugin/extension that allow one to integrate Openstack with various vendor provided software/hardware such as special hypervisor, router/switch hardware/software, etc. Moreover, there is latitude for customization in the exact design used in deployment due to various context-sensitive factors.

On the other hand, their similarities:
- Both rely on various Linux networking facilities, particularly the programmable ones (and those that have those slant even if not exactly programmable), such as Network Namespace for isolation, and bridge for a form of virtual network.
- Both have an internal and external model. Both need special care in the external part as this is where software may not have total control of the enviornment and hence some adjustment/matching may be needed for things to work well.

# Reference

https://networkop.co.uk/blog/2016/04/22/neutron-native/

