# Bonus

Here's some extra credits.

## VNC and Monitor

Credit: https://ahelpme.com/linux/howto-do-qemu-full-virtualization-with-bridged-networking/

Add these arguments to `qemu-system-x86_64`:

`-daemonize -vnc 127.0.0.1:1`

`-monitor telnet:127.0.0.1:5801,server,nowait`

Note that the VNC is used to allow user to operate the computer without SSH, while the monitor refers to the management console of qemu itself.
