# Does the current vegetation in Heidelberg suffice to compensate the GHG emissions of the whole city?

<a href="https://github.com/fossgis2122/home/blob/e5aa74674c3a5d00ed566d79ccd8507bb6f41c33/docs/project_deliverables.md">Deliverables</a>

## General information

Für einen konkreten Zeitpunkt möchten wir die Vegetationsflächen in Heidelberg bestimmen und mit GHG-Emissionswerten vergleichen, um herausfinden, ob sie zur Kompensation der GHG-Emissionen ausreichen. Das Projekt soll dazu dienen, GHG-Emissionen einer Region mit deren Vegetationsflächen in Zusammenhang zu setzen und Aussagen über die Klimabilanz treffen zu können. Durch Automatisierung sollen verschiedene Regionen untersucht werden können.

## Software requirements

Programs:
- QGIS Desktop 3.22
- **OSGeo4W Shell**

## How to install

OSGeo4W entsprechend den Anweisungen <a href="https://github.com/fossgis2122/home/blob/cef5499f150e6735b5d9f61ed512bb196de57ced/docs/course_preparation.md">hier</a> installieren 

## Needed data

- Multispectral raster data of Heidelberg: Sentinel 2 data (https://scihub.copernicus.eu/dhus/#/home), it's available free and has a resolution of 10m in the needed bands red, green, blue and NIR 
- Vector data of Heidelberg: GADM data by country (https://gadm.org/download_country.html), it's available free, is structured in different administrative levels and comes with interesting additional data
- Emission (CO2) data: OpenGHGMap (https://openghgmap.net/), it's available free, outputs one total emission value per city/region and shows the different sources of emission
- Compensation ability of vegetation: values from literature 

### How to aquire Sentinel 2 data

1. Navigate to <a href="https://scihub.copernicus.eu/dhus/#/self-registration">Copernicus Open Access Hub by ESA registration form</a> and set up an account
2. Log in on <a href="https://scihub.copernicus.eu/dhus/#/home">Copernicus Open Access Hub</a>
    - Without logging in you cannot download the required data
3. Specify search area in the map with right-click (move map with left-click and zoom in with mouse wheel)
4. Click on the three stripes left in the search box to open the advanced search (upper left corner of screen)
5. Select Sentinel 2 and put following statement in the box for the cloud cover: [0 TO 10]
6. If you want to search for data in a specific time period, put the required dates in "sensing period"
7. Click on the search button (upper right of search box) and wait until results are displayed
8. Search for an image with full extent (no black parts) and minimal cloud cover
9. Hover over the entry and click on the eye icon ("View product details")
10. Check in the quick look window if the data seems suitable
11. In the Inspector, navigate to GRANULE/*Name of data*/IMG_DATA/R10m/ and download the three bands "...B02..., ...B03..., ...B04... & ...B08..." (all .jp2)
12. When downloaded, put the four files in a folder "data/Sentinel_2" and move it where the scripts of this project are located

### How to aquire vector data

1. Navigate to <a href="https://gadm.org/download_country.html">GADM data by country</a>, select a country and download the Geopackage
2. When downloaded, unzip the ZIP-file and move the Geopackage to the folder where the scripts of this project are located 

### How to aquire emission data

1. Navigate to <a href="https://openghgmap.net/">OpenGHGmap</a> and wait until the data is loaded (coloring the base map)
2. Specify the search area by zooming in with the mouse wheel
3. Click on the three stripes to open the menue (upper right corner)
4. Click on Counties (lvl=6)
5. Hover over the region you want to see data from and write down the red value

## How to run

**Attention: you are required to put all files in the exact locations and rename them exactly as described in this manual!**

1. Rename the four raster data files into the scheme "B02.jp2", ..., "B08.jp2".
2. Run "preprocess_ndvi.bat" and keep an eye on the locations and names of the folders and files (take a look at <a href="data_structure.png">data_structure.png</a>)
