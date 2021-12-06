# Does the vegetation of the last X years/on day X suffice to compensate the CO2-emissions of the city of Heidelberg?

Für einen konkreten Zeitpunkt möchten wir die Vegetationsdecken in Heidelberg bestimmen und mit Emissionswerten (CO2) vergleichen, um herausfinden, ob sie zur Kompensation der CO2-Emissionen ausreichen.

Bei Bedarf lässt sich auch ein Zeitfaktor hinzunehmen, der beschreibt, wie sich die Situation über einen Zeitraum X verändert hat.
Ebenfalls kann eine graphische Darstellung hinzugefügt werden, die Kernbereiche der Vegetation und Emission beschreibt und in ein visuelles Verhältnis setzt.



## Benötigte Daten:

1. Rasterdaten von Heidelberg (multispektrale Aufnahmen zur Berechnung eines Vegetationsindex)
2. Vektordaten von Heidelberg zum Clippen und zur Ausweisung von Flächen, die mit einbezogen oder ausgegrenzt werden sollen (z.B. Heidelberg Zement)
4. Emissionsdaten (CO2) Heidelberg (am besten als Rasterdaten für die potentielle graphische Darstellung)
5. Durchschnittswert der vegetativen CO2-Kompensation (Literatur und zusätzlich an Heidelberg berechnet)

## Implementationsplan:

1. Import der drei Datensätze (Open data)
2. Clippen der Rasterdaten mit Vektordaten auf Heidelberg
3. Festlegung der einzubeziehenden oder auszugrenzenden Flächen 
4. Classification: Spektralaufnahmen auswerten -> Klassifikationsmethode für Vegetationsbereiche (Grenzwerte von Vegetationsindizes) -> Image Analysis in QGIS
5. Zusammenfassen oder Bereiche ausweisen
6. Durchschnittswerte aus der Literatur nehmen und berechnen und mit Emissionswerten vergleichen, sodass eine Aussage getroffen werden kann
7. Zusätzlich möglich: multi-Temporal data processing: Einbeziehung des Zeitfaktors
8. Zusätzlich möglich: multi-criteria analysis: wo kann mehr Vegetation erschaffen werden? 
9. Das Ganze als Skript oder Model, damit der Ablauf auch für andere Gebiete angewandt werden kann
