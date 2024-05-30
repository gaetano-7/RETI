#!/bin/sh

tunctl -t tap0 -g netdev

ifconfig tap0 10.0.7.1/30

ifconfig tap0 up

# firewall

iptables -t nat -F
iptables -t nat -X
iptables -F
iptables -X

iptables -t nat -A POSTROUTING -o wlo1 -j MASQUERADE

iptables -A FORWARD -i tap0 -j ACCEPT

# routing

sysctl -w net.ipv4.ip_forward=1

route add -net 10.0.0.0/16 gw 10.0.7.2 dev tap0