# Types of Openstack Network

Unlike other public clouds, which often already have a standard networking model in place for the end user, in Openstack the admin have the freedom to design his own model for the end user (this is referring to the model for Self Service Network/analogue of VPC in public cloud, and not the model of the underlying implementation. That being said, knowledge of the underlying implementation is necessary to understand concpets such as the *Segmentation Type*).

Once a design is chosen, this usually results in one or more pre-created network that user can only connect to and not modify. This include provider and external networks. By contrast, (virtual) network created by the user is known as tenant network.

In general, tenant network is implemented in Openstack by using technologies like VLAN and vxLan. This enforce separation of traffic among different tenants.

## Private vs Shared Network

Among network created by end user, one can choose whether to make it shared or not. When shared, this allows other tenant to access it also, subject to RBAC for security.

In this lab, we will create these different types of network as both admin and end user and see their differences.

# Reference

https://superuser.openstack.org/articles/spot-the-difference-tenant-provider-and-external-neutron-networks/
https://opensource.com/article/17/4/openstack-neutron-networks

