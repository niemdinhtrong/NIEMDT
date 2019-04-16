#!/bin/bash

ip1=`cat info-user.txt | grep "IP-1" | awk '{print $2}'`
u1=`cat info-user.txt | grep "user-1" | awk '{print $2}'`
p1=`cat info-user.txt | grep "pass-1" | awk '{print $2}'`

ip2=`cat info-user.txt | grep "IP-2" | awk '{print $2}'`
u2=`cat info-user.txt | grep "user-2" | awk '{print $2}'`
p2=`cat info-user.txt | grep "pass-2" | awk '{print $2}'`

ip3=`cat info-user.txt | grep "IP-3" | awk '{print $2}'`
u3=`cat info-user.txt | grep "user-3" | awk '{print $2}'`
p3=`cat info-user.txt | grep "pass-3" | awk '{print $2}'`

ip4=`cat info-user.txt | grep "IP-4" | awk '{print $2}'`
u4=`cat info-user.txt | grep "user-4" | awk '{print $2}'`
p4=`cat info-user.txt | grep "pass-4" | awk '{print $2}'`

ip5=`cat info-user.txt | grep "IP-5" | awk '{print $2}'`
u5=`cat info-user.txt | grep "user-5" | awk '{print $2}'`
p5=`cat info-user.txt | grep "pass-5" | awk '{print $2}'`

ip2=`cat info-user.txt | grep "IP-6" | awk '{print $2}'`
u2=`cat info-user.txt | grep "user-6" | awk '{print $2}'`
p2=`cat info-user.txt | grep "pass-6" | awk '{print $2}'`

ip7=`cat info-user.txt | grep "IP-7" | awk '{print $2}'`
u7=`cat info-user.txt | grep "user-7" | awk '{print $2}'`
p7=`cat info-user.txt | grep "pass-7" | awk '{print $2}'`

ip8=`cat info-user.txt | grep "IP-8" | awk '{print $2}'`
u8=`cat info-user.txt | grep "user-8" | awk '{print $2}'`
p8=`cat info-user.txt | grep "pass-8" | awk '{print $2}'`

ip9=`cat info-user.txt | grep "IP-9" | awk '{print $2}'`
u9=`cat info-user.txt | grep "user-9" | awk '{print $2}'`
p9=`cat info-user.txt | grep "pass-9" | awk '{print $2}'`

ip10=`cat info-user.txt | grep "IP-2" | awk '{print $2}'`
u10=`cat info-user.txt | grep "user-2" | awk '{print $2}'`
p10=`cat info-user.txt | grep "pass-2" | awk '{print $2}'`

#######################################################
echo "command can thuc thi:"
read command

SSHPASS=$p1 sshpass -e ssh $u1@$ip1  $command

SSHPASS=$p2 sshpass -e ssh $u2@$ip2  $command

SSHPASS=$p3 sshpass -e ssh $u3@$ip3  $command

SSHPASS=$p4 sshpass -e ssh $u4@$ip4  $command

SSHPASS=$p5 sshpass -e ssh $u5@$ip5  $command

SSHPASS=$p6 sshpass -e ssh $u6@$ip6  $command

SSHPASS=$p7 sshpass -e ssh $u7@$ip7  $command

SSHPASS=$p8 sshpass -e ssh $u8@$ip8  $command

SSHPASS=$p9 sshpass -e ssh $u9@$ip9  $command

SSHPASS=$p10 sshpass -e ssh $u10@$ip10  $command