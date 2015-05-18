#!/bin/bash
############################################
###
###自动安装第三方库
###
###########################################

rm Podfile
touch Podfile

mypath="$(pwd)/libname.txt"
echo $mypath
if [ ! -f "$mypath" ];then
  echo "the file libname.txt is not exist!"
  exit 1
fi

let i=0
let count=0
let bool=0

echo "platform :ios, '6.0'" >> Podfile
cat libname.txt | while read LINE
do
	foo=$LINE
	echo ${foo}
	let isfinish=1
	while [[ $isfinish == 1 ]];
	do	
		let count++
		echo "第 ${count}次刷库中..."
		if [ ${bool} -eq 0 ];then 
	  	  echo $foo >> Podfile
		  let bool=1
		fi
		if [ $i -eq 0 ];then
	 	  echo "First install,までまで"
	 	  if [ $? -eq 0 ];then
	  	    echo "$i code name add to Podfile Success!"
		    let bool=1
		    #pwd
		    pod install
		    if [ $? -eq 0 ];then
		      echo "the $i file install success"
		      let bool=0
		      let i++
		      let isfinish==0
		      break
		    fi
	 	  fi
		else
	 	  echo "$i install,までまで"
	 	  if [ $? -eq 0 ];then
		    echo "$i code name add to Podfile Success"
		    let bool=1
		    #pwd
		    pod install --no-integrate
		    if [ $? -eq 0 ];then
		      echo "the $i file install success"
		      let bool=0
		      let i++
		      let isfinish==0
		      break
		    fi
	 	fi
	       fi
	done
done
#foo=($(cat libname.txt))

echo "Software is ready for install Success !"
exit 0
