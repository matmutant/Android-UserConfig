#!/system/xbin/bash
#If you have less or more than 8 Cores, edit the following N number of Cores with {0..N-1}
for c in {0..7}
do
	pathVarA="/sys/devices/system/cpu/cpu$c/cpufreq/scaling_"
	pathVarB="_freq"
	pathVarG="governor"
	catGov=$(/system/bin/cat "$pathVarA$pathVarG")
	echo -e "\tcpu$c \ngovernor: $catGov"
	for i in 'min' 'max' 'cur'
	do
		catFreq=$(/system/bin/cat "$pathVarA$i$pathVarB")
		echo "$i freq: $catFreq kHz"
	done
	echo "------"
done
