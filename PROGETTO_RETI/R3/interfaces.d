source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.0.7.14/30
    gateway 10.0.7.13

auto eth1
iface eth1 inet static
    address 10.0.5.1/25

auto eth2
iface eth2 inet static
    address 10.0.4.1/27
