Hier eine Übersicht, wie man an die Daten kommen kann:

- Vector (OSM): http://download.geofabrik.de/europe/germany/baden-wuerttemberg/karlsruhe-regbez.html
- Raster: https://geoservice.dlr.de/web/maps/de:resa:mosaic
  - WMS-Server: https://geoservice.dlr.de/eoc/imagery/wms?SERVICE=WMS&
- Das will ich haben: https://service.lgl-bw.de/dgm-dop-viewer/client/index.html

Welche Versionen welcher Programme sollten benutzt werden?
- SCP ist ein Plugin aus QGIS, welches easy installiert werden kann
  - SCP 
- 

## Installationshinweise/-anleitung
1. QGIS Version xx 
  - mit den Plugins blablabla
2. Plugin: Semi-Automatic Classification
  - dazu muss Python Version 3.7 oder neuer auf dem System installiert sein (kommt theoretisch mit QGIS)
  - SCP benötigt neben Python auch die Bibliotheken Numpy, Scipy und Matplotlib, daher Kommandozeile mit Administratorrechten öffnen und eingeben: `python -m pip install --user numpy scipy matplotlib ipython jupyter pandas sympy nose`
