# Does the current urban vegetation in Heidelberg suffice to compensate the GHG emissions of the whole city?

Für einen konkreten Zeitpunkt möchten wir die Vegetationsflächen in Heidelberg bestimmen und mit GHG-Emissionswerten vergleichen, um herausfinden, ob sie zur Kompensation der GHG-Emissionen ausreichen.

Ebenfalls kann eine graphische Darstellung hinzugefügt werden, die Kernbereiche der Vegetation und Emission beschreibt und in ein visuelles Verhältnis setzt. Dadurch kann es möglich sein Flächen zu bestimmen, die zur weiteren Bepflanzung mit kompensierender Vegetation sinnvoll wären.


## Benötigte Daten:

1. Rasterdaten von Heidelberg (multispektrale Aufnahmen zur Berechnung eines Vegetationsindex)
2. Vektordaten von Heidelberg zum Clippen und zur Ausweisung von Flächen, die mit einbezogen oder ausgegrenzt werden sollen (z.B. Heidelberg Zement)
4. Emissionsdaten (CO2) Heidelberg (am besten als Rasterdaten für die potentielle graphische Darstellung)
5. Durchschnittswert der vegetativen CO2-Kompensation (Literatur und zusätzlich an Heidelberg für jede Klasse berechnet)

### Mögliche Datenquellen:

- Sentinel-2 (Emission API nicht sinnvoll, da Auflösung zu niedrig und kein CO2 -> nur Absolutwert möglich, keine graphische Darstellung)
- Landsat 8
- Emission API als Absolutwert oder https://openghgmap.net/
- ohsome API für OSM-Vektordaten

## Implementationsplan:

1. Import der Datensätze
2. Preprocessing (clip, reprojection etc.)
3. Festlegung der einzubeziehenden oder auszugrenzenden Flächen (Heidelberg Zement?)
4. Analysis: Classification
   1. Spektralaufnahmen auswerten -> NDVI bilden und Schwellenwerte bestimmen -> Image Analysis in QGIS (geht Automatisiert) 
   2. Semi-Automatic Classification Plugin (SCP) -> (Schauen ob Automatisieren geht)
5. Durchschnittswerte aus der Literatur für die Klassen nehmen und gesamte Bindekapazität der urbanen Vegetation gewichtet berechnen
6. Mit Emissionswerten vergleichen, sodass eine Aussage getroffen werden kann
9. Das Ganze als Skript oder Model, damit der Ablauf auch für andere Gebiete (in Deutschland) angewandt werden kann

## Literatur

- Durchschnittswert von 24 kg CO2/tree und 500 Trees/hectare. This means that 1 hectare of forest: 500 trees x 24 kg CO2/tree = 12,000 kg of CO2 offsets, i.e. 12 tonnes CO2/hectare. - https://www.encon.be/en/calculation-co2-offsetting-trees
- Mapping Public Urban Green Spaces based on OpenStreetMap and Sentinel-2 imagery using Belief Functions: Data and Source Code. - https://heidata.uni-heidelberg.de/dataset.xhtml?persistentId=doi:10.11588/data/UYSAA5
- Vergleichswerte von Leicester. - https://besjournals.onlinelibrary.wiley.com/doi/epdf/10.1111/j.1365-2664.2011.02021.x
- Vergleichswerte von Peking. - https://www.frontiersin.org/articles/10.3389/fevo.2016.00053/full

## Hilfe zum SCP
- Landsat 8 Image Classification: https://www.youtube.com/watch?v=HKNS-wsc7lo
- Downloading and preprocessing: https://www.youtube.com/watch?v=XGxYVoX2jOY
- Supervised classification of Landsat Images: https://www.youtube.com/watch?v=fUZgYxgDjsk

### Zum Durchgucken:

- https://www.nrs.fs.fed.us/units/urban/local-resources/downloads/Tree_Air_Qual.pdf
- https://www.frontiersin.org/articles/10.3389/fevo.2015.00144/full
- https://www.fs.usda.gov/ccrc/topics/urban-forests

### Stichworte:

- compensation
- sequestation
- offset
- RPP
- Kompensation
- Bindekapazität
- (GHG-)Senken
