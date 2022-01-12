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

1. OSGeo4W entsprechend den Anweisungen <a href="https://github.com/fossgis2122/home/blob/cef5499f150e6735b5d9f61ed512bb196de57ced/docs/course_preparation.md">hier</a> installieren  
2. QGIS-Plugin: Semi-Automatic Classification
    - Dazu muss Python Version 3.7 oder neuer auf dem System installiert sein (kommt mit OSGeo4W, sollte aber überprüft werden)
    - SCP benötigt neben Python auch die Bibliotheken Numpy, Scipy und Matplotlib, daher Kommandozeile mit Administratorrechten öffnen folgenden Schritten folgen: 
      - Navigation zum Installationspfad von Python (meistens C:\Program Files (x86)\Python38-32)
      - Eingabe von `python -m pip install --upgrade pip` -> dadurch wird der Python-Updater/-Downloader aktualisiert
      - Eingabe von `python -m pip install --user numpy scipy matplotlib` -> dadurch werden die drei Bibliotheken installiert
3. Account bei <a href="https://scihub.copernicus.eu/dhus/#/self-registration">Copernicus Open Access Hub der ESA</a> erstellen für Sentinel 2-Daten

## Anleitung für SCP
*(A: steht für Automatisieren (in nem Script))*
1. Plugin installieren (siehe Installationshinweise)
2. Copernicus Open Access Hub Logindaten in das Pluginfenster eintragen
3. Sentinel 2-Daten herunterladen und preprozessieren (Bänder 2, 3, 4 & 8) -> https://www.youtube.com/watch?v=XGxYVoX2jOY
4. Vektordaten herunterladen: GADM (für Deutschland liegen die Daten bereits vor)
5. A: Build Virtual Raster
6. A: Clip raster with vector (select vector und so)
7. 
