source /etc/network/interfaces.d/*

auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.0.7.10/30
    gateway 10.0.7.9

auto eth1
iface eth1 inet static
    address 10.0.7.13/30

post-up sh /etc/network/route.sh