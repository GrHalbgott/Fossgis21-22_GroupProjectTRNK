# Does the vegetation on day X/of the last X years suffice to compensate the CO2-emissions of the city of Heidelberg in that time period?

Für einen konkreten Zeitpunkt möchten wir die Vegetationsflächen in Heidelberg bestimmen und mit Emissionswerten (CO2) vergleichen, um herausfinden, ob sie zur Kompensation der CO2-Emissionen ausreichen.

Bei Bedarf lässt sich auch ein Zeitfaktor hinzunehmen, der beschreibt, wie sich die Situation über einen Zeitraum X verändert hat.
Ebenfalls kann eine graphische Darstellung hinzugefügt werden, die Kernbereiche der Vegetation und Emission beschreibt und in ein visuelles Verhältnis setzt. Dadurch kann es möglich sein Flächen zu bestimmen, die zur weiteren Bepflanzung mit kompensierender Vegetation sinnvoll wären.



## Benötigte Daten:

1. Rasterdaten von Heidelberg (multispektrale Aufnahmen zur Berechnung eines Vegetationsindex)
2. Vektordaten von Heidelberg zum Clippen und zur Ausweisung von Flächen, die mit einbezogen oder ausgegrenzt werden sollen (z.B. Heidelberg Zement)
4. Emissionsdaten (CO2) Heidelberg (am besten als Rasterdaten für die potentielle graphische Darstellung)
5. Durchschnittswert der vegetativen CO2-Kompensation (Literatur und zusätzlich an Heidelberg berechnet)

### Mögliche Quellen:

. Sentinel-2
. Landsat 5

## Implementationsplan:

1. Import der drei Datensätze (Open data)
2. Clippen der Rasterdaten mit Vektordaten auf Heidelberg
3. Festlegung der einzubeziehenden oder auszugrenzenden Flächen 
4. Classification: Spektralaufnahmen auswerten -> Klassifikationsmethode für Vegetationsbereiche (Grenzwerte von Vegetationsindizes) -> Image Analysis in QGIS => Semi-Automatic Classification Plugin (SCP): https://www.youtube.com/watch?v=HKNS-wsc7lo
6. Zusammenfassen oder Bereiche ausweisen
7. Durchschnittswerte aus der Literatur nehmen und berechnen und mit Emissionswerten vergleichen, sodass eine Aussage getroffen werden kann
8. Zusätzlich möglich: multi-Temporal data processing: Einbeziehung des Zeitfaktors
9. Zusätzlich möglich: multi-criteria analysis: wo kann mehr Vegetation erschaffen werden? 
10. Das Ganze als Skript oder Model, damit der Ablauf auch für andere Gebiete angewandt werden kann

## Literatur

. Durchschnittswert von 24 kg CO2/tree und 500 Trees/hectare. This means that 1 hectare of forest: 500 trees x 24 kg CO2/tree = 12,000 kg of CO2 offsets, i.e. 12 tonnes CO2/hectare. - https://www.encon.be/en/calculation-co2-offsetting-trees
. Mapping Public Urban Green Spaces based on OpenStreetMap and Sentinel-2 imagery using Belief Functions: Data and Source Code. - https://heidata.uni-heidelberg.de/dataset.xhtml?persistentId=doi:10.11588/data/UYSAA5
