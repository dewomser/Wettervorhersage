# Wettervorhersage
[![Trigger: Push action](https://github.com/dewomser/Wettervorhersage/actions/workflows/main.yml/badge.svg)](https://github.com/dewomser/Wettervorhersage/actions/workflows/main.yml) Shellchecked

Lokale Wettervorhersage mit Opendata DWD /Mosmix in  Bash

![alt text](./Grafik/wetter1.png "Screenshot Wettervorhersage")


## Vorraussetzung:
Um die Daten abzurufen verwende ich [Wetterdienst](https://pypi.org/project/wetterdienst/) .

Für das Diagramm benutze ich Gnuplot "apt install gnuplot" .
## Allgemein
Mögliche Parameter und Einheiten :

wetterdienst about coverage --provider DWD --network mosmix

Stationen kann man auswählen :

https://www.dwd.de/DE/leistungen/met_verfahren_mosmix/mosmix_stationskatalog.cfg

## wetter1.sh
konfiguriert für einewöWoche Vorraussage
Anfangs und Enddatum kann über die Variablen eingestellt werden . (maximal 10 Tage in die Zukunft)
--station=K2635 durch gewünschte Station ersetzen s.o.

## wetter1.gp
set title ersetzen

02.07.2023 : Ich hab die 2 Skripte an die geänderte API von DWD/MOSMIX angepasst.
