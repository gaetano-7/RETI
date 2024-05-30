#!/bin/sh

iptables -F
iptables -X

iptables -t nat -F
iptables -t nat -X

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# abilitare le connessioni già stabilite
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# abilitare ssh

# su f1
iptables -A INPUT -p tcp --dport ssh -s 10.0.7.1 -i eth0 -j ACCEPT

# su f2
iptables -A FORWARD -p tcp --dport ssh -s 10.0.7.1 -d 10.0.7.6 -i eth0 -o eth2 -j ACCEPT

# su r1
iptables -A FORWARD -p tcp --dport ssh -s 10.0.7.1 -d 10.0.7.10 -i eth0 -o eth2 -j ACCEPT

# su r3
iptables -A FORWARD -p tcp --dport ssh -s 10.0.7.1 -d 10.0.7.14 -i eth0 -o eth2 -j ACCEPT

# abilitare i ping

iptables -A INPUT -p icmp -j ACCEPT
iptables -A OUTPUT -p icmp -j ACCEPT
iptables -A FORWARD -p icmp -j ACCEPT

# abilitare il dns

iptables -A OUTPUT -p udp --dport 53 -j ACCEPT

# accettare comunicazini verso dmz per i servizi dns. smtp, ftp

iptables -N allDmz

iptables -A FORWARD -o eth1 -d 10.0.6.0/27 -j allDmz

iptables -A allDmz -p tcp --dport 53 -j ACCEPT
iptables -A allDmz -p tcp --dport smtp -j ACCEPT
iptables -A allDmz -p tcp --dport ftp -j ACCEPT

# dmz può aprire comunicazioni solo con RED

iptables -N dmzRed

iptables -A FORWARD -i eth1 -o eth2 -s 10.0.6.0/27 -d 10.0.4.0/23 -j dmzRed

iptables -A dmzRed -j ACCEPT


# green può aprire comunicazioni con tutti

iptables -N greenAll

iptables -A FORWARD -i eth2 -s 10.0.0.0/22 -j greenAll

iptables -A greenAll -j ACCEPT