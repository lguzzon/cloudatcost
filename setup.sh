#!/bin/bash

if [[ -z $CACIP || -z $CACUSER || -z $CACSUBDOMAIN ]]; then
  echo "Usage..."
  exit 1
fi

<<<<<<< HEAD
ssh root@$CACIP "curl -s https://raw.githubusercontent.com/lguzzon/cloudatcost/master/root.sh | bash -s \"$CACUSER\""
=======
ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no root@$CACIP "wget -O /dev/stdout https://raw.githubusercontent.com/yulvil/cloudatcost/master/root.sh 2>/dev/null | bash -s $CACUSER"
if [[ $? -ne 0 ]]; then
  exit $?
fi
>>>>>>> upstream/master

CACPWD=$(cat /proc/sys/kernel/random/uuid | tr -d '-')
echo $CACPWD
<<<<<<< HEAD
curl -s https://raw.githubusercontent.com/lguzzon/cloudatcost/master/user_local.sh | bash -s $CACIP $CACUSER $CACPWD
=======
curl -s https://raw.githubusercontent.com/yulvil/cloudatcost/master/user_local.sh | bash -s $CACIP $CACSUBDOMAIN $CACUSER $CACPWD
>>>>>>> upstream/master

ssh $CACUSER@$CACIP 'curl -s https://raw.githubusercontent.com/lguzzon/cloudatcost/master/user.sh | bash -s'
