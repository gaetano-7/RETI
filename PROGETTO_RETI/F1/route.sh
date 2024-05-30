#!/bin/sh

#GREEN
route add -net 10.0.0.0/23 gw 10.0.7.6 dev eth2

#CD4
route add -net 10.0.7.8/30 gw 10.0.7.6 dev eth2

#CD5
route add -net 10.0.7.12/30 gw 10.0.7.6 dev eth2

#RED
route add -net 10.0.4.0/23 gw 10.0.7.6 dev eth2