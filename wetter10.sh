#!/bin/bash

anfang=$(date -d "next hour" '+%Y-%m-%dT%H')
ende=$(date -d "next week" '+%Y-%m-%dT%H')

wetterdienst values --provider=dwd --network=mosmix --resolution=large --parameter=TTT --station=K2635 --date=$anfang/$ende | jq -r '.[]| [.date,.value -273.15 ] | @csv'>temp.csv
wetterdienst values --provider=dwd --network=mosmix --resolution=large --parameter=E_TTT --station=K2635 --date=$anfang/$ende | jq -r '.[]|[.date,.value ] | @csv'>tempe.csv
wetterdienst values --provider=dwd --network=mosmix --resolution=large --parameter=R101 --station=K2635 --date=$anfang/$ende | jq -r '.[]| [.date,.value ] | @csv'>regen1.csv
wetterdienst values --provider=dwd --network=mosmix --resolution=large --parameter=R110 --station=K2635 --date=$anfang/$ende | jq -r '.[]| [.date,.value ] | @csv'>regen10.csv

paste -d ',' temp.csv regen1.csv regen10.csv tempe.csv > wetter.csv

sleep 2

gnuplot wetter1.gp

sleep 2

gwenview wetter1.png
