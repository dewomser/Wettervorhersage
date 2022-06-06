set title "Wettervorhersage für Worms. Erstellt: "  .strftime("%d.%b %Y %H:%M", time(0)+7200)
set datafile separator ','
set xdata time
set timefmt "%Y-%m-%dT%H"
set format x "%m:%d:%H" # otherwise it will show only MM:SS

set key autotitle columnhead
set ylabel "Temperatur °Celsius"
set xlabel 'Zeitachse UTC'

set xtics rotate
set y2tics # enable second axis
set ytics nomirror # dont show the tics on that side
set y2label "Regenwahrscheinlichkeit in %" # label for second axis
#set terminal wxt size 800,600 enhanced font 'Verdana,10' persist
set terminal pngcairo size 800,600 enhanced font 'Verdana,10'
set output 'wetter1.png'

plot 'wetter.csv' using 1:2:5 title 'Temperatur' with yerrorbars linestyle 2,'' using 1:3 with lines axis x1y2 title '0.1 mm/h', '' using 1:4 with lines axis x1y2 title '1.0 mm/h'
