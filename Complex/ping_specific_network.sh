#!/bin/bash
#
#*******************************************************************************
#Author:			steveli
#QQ:				1049103823
#Data:			    2019-10-28
#FileName:		    ping_specific_network.sh
#URL:		        https://blog.csdn.net/YouOops
#Description:		ping_specific_network.sh
#Copyright (C):	    2019 All rights reserved
#*******************************************************************************
#Fontcolor#red(31):green(32):yellow(33):blue(34):purple(35):cyan(36):white(37)
#Backcolor#red(41):green(42):yellow(43):blue(44):purple(45):cyan(46):white(47)
#*******************************************************************************
#
. /etc/init.d/functions
# success
# failure
# passed
# warning

NET="192.168.1"

for ((i=0 ; i < 256 ; i++)); do
        if ping -W1 -c1 ${NET}.${i} &> /dev/null ; then
            echo "Host ${NET}.$i is UP. `success`"
        else
            echo "Host ${NET}.$i is DOWN. `warning`"
        fi
done


