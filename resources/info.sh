#!/bin/bash
function idd()
{
echo -n "Caching current device"
rm -rf $ifn
$HOME/.sn0wbreak/ideviceinfo -x > $ifn
if [ $? == 255 ]
then
echo " [ERROR]"
rm -rf $ifn
echo "Something went wrong, please make sure your device is connected and please press 'Trust' if you get a dialog on your phone, press enter to try again"
read NULL
idd
sleep 0
else
echo " [OK]"
fi
}
ifn="$HOME/.sn0wbreak/ideviceinfo.plist"
if [ ! -f $ifn ]
 then
idd
fi
if [ $1 == "iOS" ]
  then
  defaults read $ifn ProductVersion
  elif [ $1 == "device" ]
then
  defaults read $ifn  ProductType
elif [ $1 == "build" ]
then
  defaults read $ifn  BuildVersion
elif [ $1 == "identify" ]
then
 idd
else
  echo "Usage: "
  echo "$0 iOS - returns ios version of connected device"
  echo "$0 device - returns connected device"
  echo "$0 build - returns the buildid"
  echo "$0 identify - caches an actual ideviceinfo for later use"
fi
