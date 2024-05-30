#!/bin/sh

#CD5
route add -net 10.0.7.12/30 gw 10.0.7.10 dev eth0

#RED
route add -net 10.0.4.0/23 gw 10.0.7.10 dev eth0