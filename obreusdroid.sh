echo "######################################"
echo "#                                    #"
echo "#          ObreusDroid V1.0          #"
echo "#                                    #"
echo "#       Created by @fajaralhijr      #"
echo "######################################"

if pidof $1 > /dev/null
then
  echo "Android app is discovered..."
  file="$1.csv"
  echo "Elapse Time,cpu%,mem%" > $file
  pid=`pidof $1`
  while [ true ]
  do
    res=`top -b -n 1 -d 1 -o %CPU,%MEM -p $pid | sed 1,5d`
    echo "$(date +"%T") $pid: $res"
    echo "$(date +"%T") $res" >> $file
    sleep .5
  done
else 
  echo "App not found"
fi