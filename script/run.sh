#!/bin/bash
. ../../diamond_env/bin/activate
pidfile="/usr/local/diamond/var/run/diamond.pid"
if [ -f $pidfile ];then
  kill `cat $pidfile`
fi
env PYTHONDONTWRITEBYTECODE=x python ../bin/diamond -c ../etc/diamond/diamond.conf -p $pidfile
