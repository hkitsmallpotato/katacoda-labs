# Using pre-created networks in devstack

Devstack comes pre-configured with some networks:
- `private` is private to the user only and has no access from outside.
- `shared` is shared among tenant, but still no external access.
- `public` is connected to the public internet.

# Modes of exposing instance

There are two ways:
- Connect to external world through a virtual router, and associate a floating IP, relying on NAT.
- Directly attach instance to the external network.

# Other

`neutron net-create --shared --router:external=false admin1-shared`