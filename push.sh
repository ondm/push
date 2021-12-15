#!/bin/bash

while true; do
MAXTEMP=$({(nvidia-smi -q | grep "GPU Current Temp" | awk '{print $5}')} | \
 awk '{if(max=="") {max=$1}; if($1>max) {max=$1}} END {print max}')
if [ $MAXTEMP -lt "30" ] ; then     
    curl -s "https://push.dnson.cn/?title=Linux101&des=$MAXTEMP"
elif [ $MAXTEMP -gt "70" ] ; then   
    curl -s "https://push.dnson.cn/?title=Linux101&des=$MAXTEMP" 
else 
    exit 0 
fi    
sleep 120s
done
