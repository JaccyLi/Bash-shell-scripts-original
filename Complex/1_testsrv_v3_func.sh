#!/bin/bash
#
#*******************************************************************************
#Author:			steveli
#QQ:				1049103823
#Data:			    2019-10-29
#FileName:		    testsrv.sh
#URL:		        https://blog.csdn.net/YouOops
#Description:		testsrv.sh
#Copyright (C):	    2019 All rights reserved
#*******************************************************************************
#Fontcolor#red(31):green(32):yellow(33):blue(34):purple(35):cyan(36):white(37)
#Backcolor#red(41):green(42):yellow(43):blue(44):purple(45):cyan(46):white(47)
#*******************************************************************************
#
#chkconfig: - 93 3
#description:A fake service script.Do nothing.
#

COLOR_GREEN="\e[1;32m"
COLOR_RED="\e[1;31m"
COLOR_END="\e[0m"
DIR="/var/lock/subsys"
SCR="service"

. /etc/init.d/functions
# success
# failure
# passed
# warning

if [[ ! $1 ]]; then
    echo -e "Usage:`basename $0` {${COLOR_GREEN}start|stop|restart|status${COLOR_END}}"
fi

start()
    {
    if [[ ! -f $DIR/`basename $0` ]]; then
        mkdir -p $DIR &> /dev/null
        touch $DIR/`basename $0` &> /dev/null
        echo "Start Succeeded.`success`"
    else
        echo "Already Started.`passed`"
    fi
    }

stop()
    {
    if [[ -f $DIR/`basename $0` ]]; then
        rm $DIR/`basename $0` &> /dev/null
        echo "Stop completed."
    else
        echo "Already Stopped.`passed`"
    fi
    }

restart()
    {
    if [[ -f $DIR/`basename $0` ]]; then
        rm $DIR/`basename $0` &> /dev/null
        sleep 0.5
        touch $DIR/`basename $0` &> /dev/null
        echo "Restart Succeeded.`success`"
    else
        echo "It's Stopped.Now starting...`passed`"
        touch $DIR/`basename $0` &> /dev/null
        sleep 0.5
        echo "Start Succeeded.`success`"
    fi
    }

status()
    {
    if [[ -f $DIR/`basename $0` ]]; then
        echo -e "`basename $0` is active.${COLOR_GREEN}[RUNNING]${COLOR_END}"
    else
        echo -e "`basename $0` is inactive.${COLOR_RED}[STOPPED]${COLOR_END}" 
    fi
    }



case $1 in
start)
start
    ;;
stop)
stop
    ;;
restart)
restart
    ;;
status)
status
    ;;
*) 
    if [[ $1 ]]; then
    echo -e "Usage:`basename $0` {${COLOR_GREEN}start|stop|restart|status${COLOR_END}}"
    else 
    :
    fi
    ;;
esac

unset COLOR_GREEN
unset COLOR_RED
unset COLOR_END
unset DIR
unset SCR
