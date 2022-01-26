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
- Landuse data (vector) of Heidelberg: ohsome API, because it's fast, it's free and it's versatile
- Emission (CO2) data: OpenGHGMap (https://openghgmap.net/), it's available free, outputs one total emission value per city/region and shows the different sources of emission
- Compensation ability of vegetation: values from literature 

<details>
   <summary><b>How to aquire raster (Sentinel 2) data</b></summary>
<br>
    
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
11. In the Inspector, navigate to GRANULE/*Name of data*/IMG_DATA/R10m/ and download the two files "...B04..." & "...B08..." (both .jp2)
12. When downloaded, put the four files in a folder "data/sentinel_2" and move the folder "data" where the scripts of this project are located (take a look at <a href="data_structure.png">data_structure.png</a>)

</details>

<details>
   <summary><b>How to aquire vector data of the region of interest (RoI)</b></summary>
<br>

1. Navigate to <a href="https://gadm.org/download_country.html">GADM data by country</a>, select Germany and download the Geopackage
2. When downloaded, unzip the ZIP-file and move the Geopackage to the folder where the scripts of this project are located (take a look at <a href="data_structure.png">data_structure.png</a>)
3. Execute the script "roi_extractor.bat"
4. You immediately are required to enter the roi. Any name of a city should work, for additional information you should look into the gadm36_DEU.gpkg and search under column "Name_3" for the exact name of your roi (try e.g. Heidelberg, Karlsruhe, Mannheim or Speyer) - it has to be in the extent of the Sentinel-2 raster images!
5. You can close the shell window

</details>

<details>
   <summary><b>How to aquire emission data</b></summary>
<br>

1. Navigate to <a href="https://openghgmap.net/">OpenGHGmap</a> and wait until the data is loaded (coloring the base map)
2. Specify the search area by zooming in with the mouse wheel
3. Click on the three stripes to open the menue (upper right corner)
4. Click on Counties (lvl=6)
5. Hover over the region you want to see data from and write down the red value

</details>

## How to run

**Attention: you are required to put all files in the exact locations and rename them exactly as described in this manual!**

Part 1: Preprocessing
1. Rename the file with ...B04... in its name into "b04_Red.jp2" and the other one into "b08_NIR.jp2"
2. Run "preprocess.bat" and 
3. Open the OSGeo4W Shell and navigate to the folder where the scripts are located
4. Enter "preprocess.bat" and execute the command
5. Keep an eye on the locations and names of the folders and files (take a look at <a href="data_structure.png">data_structure.png</a>)
6. You can close the shell window

Part 2: Analysis
1. Open QGIS
2. Navigate to the folder with the scripts and double-click on the model "fossgis22"
3. Put in all required data (should be self explanatory) and specify the output folder as the folder where the scripts are located
  - the raster bands are the two from the ./data/sentinel_2 folder
5. 


---
## Literature:

NDVI and classification of NDVI-values: https://www.researchgate.net/publication/275030305_Evaluating_Multispectral_Images_and_Vegetation_Indices_for_Precision_Farming_Applications_from_UAV_Images
