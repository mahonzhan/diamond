#!/bin/bash

set -e
filepath=$(cd "$(dirname $0)";pwd)
PYTHON="python"
python_ver=`$PYTHON -V 2>&1 | awk '{print substr($2,0,3)}'`
res=`echo "$python_ver <= 2.4" | bc`
if [ $res -eq 1 ];then
  if [ -x /usr/bin/python26 ];then
    PYTHON="/usr/bin/python26"
  elif [ -x /usr/local/bin/python ];then
    PYTHON="/usr/local/bin/python"
  else
    echo "Unsupported python version" >&2
  fi
fi
cd $filepath/../pkg
tar zxf virtualenv-1.11.6.tar.gz
tar zxf configobj-5.0.6.tar.gz
tar zxf six-1.8.0.tar.gz
tar zxf requests-2.4.3.tar.gz
tar zxf influxdb-0.1.12.tar.gz

cd virtualenv-1.11.6
$PYTHON virtualenv.py $filepath/../../diamond_env
. $filepath/../../diamond_env/bin/activate

cd ../configobj-5.0.6
python setup.py install

cd ../six-1.8.0
python setup.py install

cd ../requests-2.4.3
python setup.py install

cd ../influxdb-0.1.12
python setup.py install

cd .. && rm -rf virtualenv-1.11.6 configobj-5.0.6 six-1.8.0 influxdb-0.1.12 requests-2.4.3

cp -rpv ../lib ../../diamond_env/lib/python2.6/site-packages/diamond
