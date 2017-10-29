#!/system/xbin/bash


#catFreqCPU $c $i $pathVarA $pathcVarB
catFreqCPU() {
	c=$1
	i=$2
	pathVarA=$3
	pathVaB=$4
	catFreq=$(/system/bin/cat "$pathVarA$i$pathVarB")
	#echo -e "\t$i freq: $catFreq kHz \c "
	echo -e "\t $catFreq kHz \c "
}

#catGovCPU $c $pathVarA $pathVarG
catGovCPU() {
	c=$1
	pathVarA=$2
	pathVarG=$3
	catGov=$(/system/bin/cat "$pathVarA$pathVarG")
	echo -e "\ncpu$c \t $catGov \c"
}

echo -e "Core \t Governor \t Current Freq \t min Freq \t Max Freq"
for c in {0..7}
do
	pathVarG="governor"
	pathVarA="/sys/devices/system/cpu/cpu$c/cpufreq/scaling_"
	catGovCPU $c $pathVarA $pathVarG
	for i in 'cur' 'min' 'max'
	do
		pathVarA="/sys/devices/system/cpu/cpu$c/cpufreq/scaling_"
		pathVarB="_freq"
		catFreqCPU $c $i $pathVarA $pathVarB
	done
done

echo -e "\n"
