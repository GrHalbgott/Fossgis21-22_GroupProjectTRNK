# Does the current urban vegetation in Heidelberg suffice to compensate the GHG emissions of the whole city?

## General information

Für einen konkreten Zeitpunkt möchten wir die Vegetationsflächen in Heidelberg bestimmen und mit GHG-Emissionswerten vergleichen, um herausfinden, ob sie zur Kompensation der GHG-Emissionen ausreichen. Das Projekt soll dazu dienen, GHG-Emissionen einer Region mit deren Vegetationsflächen in Zusammenhang zu setzen und Aussagen über die Klimabilanz treffen zu können. Durch Automatisierung sollen verschiedene Regionen untersucht werden können.

### Benötigte Daten:

1. Rasterdaten von Heidelberg (multispektrale Aufnahmen zur Berechnung eines Vegetationsindex)
  - Sentinel-2-Daten bieten sich am besten an, da Auflösung hoch genug und multispektral
  - ansonsten wären Landsat-8-Daten für größere Regionen ebenfalls möglich
2. Vektordaten von Heidelberg zum Clippen und zur Ausweisung von Flächen, die mit einbezogen oder ausgegrenzt werden sollen (z.B. Heidelberg Zement)
   - GADM-Data by country: https://gadm.org/download_country.html
3. Emissionsdaten (CO2) Heidelberg
  - https://openghgmap.net/ (ein Durchschnittswert für die ganze Stadt)
4. Durchschnittswert der vegetativen CO2-Kompensation (Literatur und zusätzlich an Heidelberg für jede Makroklasse berechnet)

## Software requirements

Programs:
- QGIS Desktop 3.22

## How to install

OSGeo4W entsprechend den Anweisungen <a href="https://github.com/fossgis2122/home/blob/cef5499f150e6735b5d9f61ed512bb196de57ced/docs/course_preparation.md">hier</a> installieren 

## How to aquire data

1. Account bei <a href="https://scihub.copernicus.eu/dhus/#/self-registration">Copernicus Open Access Hub der ESA</a> erstellen für Sentinel(2)-Daten
2. Bei Bedarf: Account bei <a href="https://earthexplorer.usgs.gov/">USGS Earth Explorer</a> erstellen für Landsat(8)-Daten

## How to run

1. 


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

*(A: steht für Automatisieren (in nem Script))*
1. Plugin installieren (siehe Installationshinweise)
2. Copernicus Open Access Hub Logindaten in das Pluginfenster eintragen
3. Sentinel 2-Daten herunterladen und preprozessieren (Bänder 2, 3, 4 & 8) -> https://www.youtube.com/watch?v=XGxYVoX2jOY
4. Vektordaten herunterladen: GADM (für Deutschland liegen die Daten bereits vor)
5. A: Build Virtual Raster
6. A: Clip raster with vector (select vector und so)
7. 
