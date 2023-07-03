set title "Wettervorhersage für Worms. Erstellt: "  .strftime("%d.%b %Y %H:%M", time(0)+7200)
set datafile separator ','
set xdata time
set timefmt "%Y-%m-%dT%H:%M"
set format x "%d.%b %H:%M" # otherwise it will show only MM:SS
set key autotitle columnhead
set ylabel "Temperatur °Celsius"
set xlabel 'Zeitachse UTC'
set xtics rotate
set y2range[0:100]
set y2tics # enable second axis
set ytics nomirror # dont show the tics on that side
set y2label "Regenwahrscheinlichkeit in %" # label for second axis
#set terminal wxt size 800,600 enhanced font 'Verdana,10' persist
set terminal pngcairo size 800,600 enhanced font 'Verdana,10'
set output 'wetter1.png'
Shadecolor = "#80E0A080"

plot 'wetter.csv' using 1:($2+$8):($2-$8) with filledcurve fc rgb Shadecolor title "Absoluter Temperaturfehler",''using 1:2 title 'Temperatur in 2 Meter Höhe' with lines lc "red",'' using 1:4 with lines axis x1y2 title 'Regen 0.1 mm/h','' using 1:6 with lines axis x1y2 title 'Regen 1.0 mm/h'
