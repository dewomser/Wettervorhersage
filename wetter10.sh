#!/bin/bash
# wetterd="/home/foo/.local/bin/wetterdienst"
wetterd="$(which wetterdienst)"
station="K2635"
#cd /home/foo/bin/wetter||exit
anfang="$(date -d "next hour" '+%Y-%m-%dT%H')"
ende="$(date -d "+10 days" '+%Y-%m-%dT%H')"

##wetterdienst values --provider=dwd --network=mosmix --resolution=large --parameter=TTT --station=K2635 --date=$anfang/$ende | jq -r '.[]| [.date,.value -273.15 ] | @csv'>temp.csv
$wetterd values --provider=dwd --network=mosmix --resolution=large --parameter=TTT --station="$station" --date="$anfang"/"$ende" --format=csv>temp.csv
$wetterd values --provider=dwd --network=mosmix --resolution=large --parameter=E_TTT --station="$station" --date="$anfang"/"$ende" --format=csv>tempe.csv
$wetterd values --provider=dwd --network=mosmix --resolution=large --parameter=R101 --station="$station" --date="$anfang"/"$ende" --format=csv>regen1.csv
$wetterd values --provider=dwd --network=mosmix --resolution=large --parameter=R110 --station="$station" --date="$anfang"/"$ende" --format=csv>regen10.csv
$wetterd values --provider=dwd --network=mosmix --resolution=large --parameter=wwS --station="$station" --date="$anfang"/"$ende" --format=csv>schnee.csv
#Winter
paste -d ',' temp.csv regen1.csv regen10.csv tempe.csv schnee.csv > wetter.csv
#Sommer
#paste -d ',' temp.csv regen1.csv regen10.csv tempe.csv > wetter.csv
sleep 2

#Sommer
#gnuplot wetter2.gp
#Winter
gnuplot wetter2_mit_schnee.gp

#sleep 2

#gwenview wetter1.png
