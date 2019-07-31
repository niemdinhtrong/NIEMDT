#/bin/sh

/sbin/sysctl -w net.ipv4.ip_forward=1
/sbin/sysctl -p
iptables -D FORWARD 1

iptables -D INPUT 1
iptables -D INPUT 2
iptables -D INPUT 2
iptables -D INPUT 2

iptables -I INPUT -s 10.10.3.0/24 -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j DROP

iptables -t nat -I POSTROUTING -s 10.10.3.0/24 -o eth0 -j SNAT --to-source 10.10.1.2
iptables -t nat -A POSTROUTING -s 10.10.2.0/24 -o eth0 -j SNAT --to-source 10.10.1.2

iptables -t nat -A PREROUTING -i eth0 -d 10.10.2.0/24 -j DNAT --to-destination 10.10.2.254
iptables -t nat -I PREROUTING -i eth0 -d 10.10.2.3 -p tcp --dport 80 -j DNAT --to-destination 10.10.2.3:80
iptables -A INPUT -d 10.10.2.254 -j DROP

iptables -t nat -A PREROUTING -i eth1 -d 10.10.3.0/24 -j DNAT --to-destination 10.10.3.254
iptables -t nat -A PREROUTING -i eth0 -d 10.10.3.0/24 -j DNAT --to-destination 10.10.3.254
iptables -A INPUT -d 10.10.3.254 -j DROP