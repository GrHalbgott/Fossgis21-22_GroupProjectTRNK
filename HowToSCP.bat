Ideas for SCP-Automation:

1. Import data (GADM36 as vector data, Sentinel 2 data as raster data (automation?)) 
2. Select Heidelberg from vector data and clip raster Band 2, 3, 4 & 8 with it
3. Build a Virtual Raster (vrt), combining three bands of the raster data into a full image (either True-Color (4-3-2) or NDVI (8-4/8+4) with `calculate raster`
 - https://github.com/innoq/sentinel2-to-ndvi describes how to convert Sentinel 2-Data into NDVI
4. Define training inputs as standardized inputs for:
 - Macroclass *vegetation* with the classes *forest*, *agriculture*, *urban vegetation* (trees/gardens), *grasslands* (and ...)
 - Macroclass *non vegetation* with the classes *water*, *infrastructure*, *bare earth* (and *buildings*)
5. 


1. Grobe Koordinaten der Stadt suchen, bei Bedarf BoundingBox erstellen und UTM-Koordinaten lesen, dann in geographische Koordinaten konvertieren
2. Diese Koordinaten kommen in das `landuse.bat`
3. 


---

## Alternative Method: SCP

### Requirements

Semi-Automatic Classification Plugin (7.10.5 or newer)
Python 3.7 or newer
Python-Bibliotheken:
- Numpy
- Scipy
- Matplotlib

### How to

2. QGIS-Plugin: Semi-Automatic Classification
    - SCP benötigt neben Python auch die Bibliotheken Numpy, Scipy und Matplotlib, daher Kommandozeile mit Administratorrechten öffnen folgenden Schritten folgen: 
      - Navigation zum Installationspfad von Python (meistens C:\Program Files (x86)\Python38-32)
      - Eingabe von `python -m pip install --upgrade pip` -> dadurch wird der Python-Updater/-Downloader aktualisiert
      - Eingabe von `python -m pip install --user numpy scipy matplotlib` -> dadurch werden die drei Bibliotheken installiert

### SCP

1. Plugin installieren (siehe Installationshinweise)
2. Copernicus Open Access Hub Logindaten in das Pluginfenster eintragen
3. Sentinel 2-Daten herunterladen und preprozessieren (Bänder 2, 3, 4 & 8) -> https://www.youtube.com/watch?v=XGxYVoX2jOY
4. Vektordaten herunterladen: GADM (für Deutschland liegen die Daten bereits vor)
5. Build Virtual Raster
6. Clip raster with vector (select vector und so)
7. 
