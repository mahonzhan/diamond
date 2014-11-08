#!/bin/bash
. /usr/local/diamond_env/bin/activate
dir="/usr/local/diamond"
pidfile="$dir/var/run/diamond.pid"
if [ -f $pidfile ];then
  echo "pid exists, restart now"
  kill `cat $pidfile`
else
  echo "Starting ..."
fi
env PYTHONDONTWRITEBYTECODE=x python $dir/bin/diamond -c $dir/etc/diamond/diamond.conf -p $pidfile
