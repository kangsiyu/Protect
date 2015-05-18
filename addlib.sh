#!/bin/bash
#########################################
##入参:$1:第三方库名$2:版本号
##添加一个第三方库
#########################################

if [ ! -n "$1" ];then
  echo "please input libname!"
  exit 1
fi

if [ ! -n "$2" ];then
  echo "please input lib's version number!"
  exit 1
fi	

podcom="pod '$1', '~> $2'"
echo $podcom
mypath=$(pwd)/Podfile
if [ ! -f $mypath ];then
  echo "File Podfile not exits!"
  exit 1
fi

echo $podcom >> Podfile
let bool=1
while [[ $bool == 1 ]];
do
  pod install --no-integrate
  if [ $? -eq 0 ];then
	echo "the $1 lib is add success"
	break;
  else
	echo "try again..."
  fi
done

echo "install done!!!"
exit 0

