source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.0.7.2/30
    gateway 10.0.7.1

auto eth1
iface eth1 inet static
    address 10.0.6.1/27

auto eth2
iface eth2 inet static
    address 10.0.7.5/30

post-up sh /etc/network/route.sh