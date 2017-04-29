#!/bin/bash
if [ ! -r $1 ] || [ `ls -l $1 | awk '{print $5}'` -eq 0 ] #check condition file
then
	echo "it can't readed, existed or file empty"
	exit 1
fi
unset line mangkq
iline=1
lmax=0
{
while read line #read line by line
do
	if [ ${#line} -gt $lmax ]
	then
		lmax=${#line}
		unset mangkq
		mangkq[0]=$iline
		im=1
		iline=$(($iline+1))
	elif [ ${#line} -eq $lmax ]
	then
		mangkq[im]=$iline
		im=$(($im+1))
		iline=$(($iline+1))
	else
		iline=$(($iline+1))
	fi
done
}<$1
#export result
if [ ${#mangkq[@]} -eq 1 ]
then
	echo "position line is longest: ${mangkq[0]}"
else
	echo "position lines are longest: ${mangkq[@]}"
fi

