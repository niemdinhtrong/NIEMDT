
#!/bin/sh

#####################################################################
echo "RAM"
cat /proc/meminfo | grep MemFree

###################################################################

echo "                                                            "

df -m | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print $4}' > infocpu

dong=`wc -l infocpu | cut -d ' ' -f 1`

for (( i = 1 ; i <= $dong ; i++ ))
    do
        
        a1=`ex +${i}p -scq infocpu`
        
        #echo $a1

        a=`expr $a + $a1`
    done
echo "Free disk: $a M"

#######################################################################

echo "                                                                  "
echo "Thong tin CPU"

echo "User: `top -n 1 | grep Cpu | awk '{print $2}'`"

echo "System: `top -n 1 | grep Cpu | awk '{print $4}'`"