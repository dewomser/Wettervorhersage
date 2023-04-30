#!/bin/bash
wetterdienst values --provider=dwd --network=mosmix --resolution=large --parameter=large --station=K2635 | jq -r '.[]  | [.date,.temperature_air_mean_200 - 273.15,.probability_precipitation_height_gt_0_1_mm_last_1h,.probability_precipitation_height_gt_1_0_mm_last_1h,.error_absolute_temperature_air_mean_200] | @csv' > wetter.csv

sleep 2

gnuplot wetter1.gp

sleep 2

gwenviaw wetter1.png
