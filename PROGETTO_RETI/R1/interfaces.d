source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.0.7.9/30

auto eth1
iface eth1 inet static
    address 10.0.0.1/23

auto eth2
iface eth2 inet static
    address 10.0.2.1/27

auto eth3
iface eth3 inet static
    address 10.0.7.6/30
    gateway 10.0.7.5

post-up sh /etc/network/route.sh