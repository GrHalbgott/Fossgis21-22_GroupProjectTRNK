# Does the current vegetation in Heidelberg suffice to compensate the GHG emissions of the whole city?

<a href="https://github.com/fossgis2122/home/blob/e5aa74674c3a5d00ed566d79ccd8507bb6f41c33/docs/project_deliverables.md">Deliverables</a>

## General information

For a specific point in time we would like to determine the vegetation areas in a region of interest (roi) and compare them with CO2 emission values to find out whether they are sufficient enough to compensate those emissions. The project should serve to correlate CO2 emissions of a roi with its vegetation areas and to be able to make statements about the climate balance. Through automation, different regions should be able to be examined easily.

Für einen konkreten Zeitpunkt möchten wir die Vegetationsflächen einer Region of Interest (ROI) bestimmen und mit CO2-Emissionswerten vergleichen, um herausfinden, ob sie zur Kompensation dieser Emissionen ausreichen. Das Projekt soll dazu dienen, CO2-Emissionen einer ROI mit deren Vegetationsflächen in Zusammenhang zu setzen und Aussagen über die Klimabilanz der ROI treffen zu können. Durch Automatisierung sollen verschiedene Regionen einfach untersucht werden können.

## Software requirements and Installation

Programs:
- QGIS Desktop 3.22 or newer
- SAGA GIS 7.8.2 or newer
> Both programs are included in the OSGeo4W-Package

### How to install

1. Download the OSGeo4W Installer from <a href="http://download.osgeo.org/osgeo4w/v2/osgeo4w-setup.exe">here</a> (official link to the current network-installer)
2. Run the installer
3. Select Advanced Install, click through the steps and keep the default values
4. Stop at "Choose packages": select the following packages for installation. Click on "Skip" in the column "New" to select a package for installation. If a package is selected for installation, the version number will be shown in the column "New". Under the section Desktop choose:
    - qgis: QGIS Desktop (3.22)
    - saga: SAGA (7.8.2-12)
    - Note: Additional packages will be selected automatically which are needed to run the ones listed above. So just keep those as well.
5. Complete the installation

## Required data

- Multispectral raster data of Heidelberg: Sentinel 2 data (https://scihub.copernicus.eu/dhus/#/home), it's available free and has a resolution of 10m in the needed bands red, green, blue and NIR 
- Vector data of Heidelberg: GADM data by country (https://gadm.org/download_country.html), it's available free, is structured in different administrative levels and comes with interesting additional data
(- Landuse data (vector) of Heidelberg: ohsome API, because it's fast, it's free and it's versatile)
- Emission (CO2) data: OpenGHGMap (https://openghgmap.net/), it's available free, outputs one total emission value per city/region and shows the different sources of emission
- Compensation ability of vegetation: values from literature 

### Aquisition of the required data

<details>
   <summary><b>How to aquire raster (Sentinel 2) data</b></summary>
<br/>
    
1. Navigate to <a href="https://scihub.copernicus.eu/dhus/#/self-registration">Copernicus Open Access Hub by ESA registration form</a> and set up an account
2. Log in on <a href="https://scihub.copernicus.eu/dhus/#/home">Copernicus Open Access Hub</a>. Without logging in you cannot download the required data
3. Specify search area in the map with right-click (move map with left-click and zoom in with mouse wheel)
4. Click on the three stripes left in the search box to open the advanced search (upper left corner of screen)
5. Select Sentinel 2 and put following statement in the box for the cloud cover: [0 TO 10]
6. If you want to search for data in a specific time period, put the required dates in "sensing period"
7. Click on the search button (upper right of search box) and wait until results are displayed
8. Search for an image with full extent (no black parts) and minimal cloud cover
9. Hover over the entry and click on the eye icon ("View product details")
10. Check in the quick look window if the data seems suitable
<br/><br/>
    > If the images you are looking for are offline, you can add them to your cart. Go to your cart (upper left next to the three stripes) and click on download (hover over entry and click on the download icon). It should say that downloading offline products is not possible. At this time, there should appear a clock icon next to the "Offline" text which says either "pending" or "running". Click on the same download button again and it should state that the offline product retrieval is initiated. At this point you did everything the right way. If you encouter problems try again following this manual. 
<br/><br/>
    > After a while (up to one hour) the datasets will be available to download for three days. Follow the next points to download the data:
11. In the Inspector, navigate to GRANULE/*Name of data*/IMG_DATA/R10m/ and download the two files "...B04..." & "...B08..." (both .jp2)
12. When downloaded, put the two files in a folder "data" and move the folder to the location of the scripts of this project (take a look at <a href="data_structure.png">data_structure.png</a> for reference)
   
</details>

<details>
   <summary><b>How to aquire vector data</b></summary>
<br/>

1. Navigate to <a href="https://gadm.org/download_country.html">GADM data by country</a>, select Germany and download the Geopackage
2. When downloaded, unzip the ZIP-file and move the Geopackage to the folder where the other data of this project is located (<a href="data_structure.png">data_structure.png</a>)

</details>

<details>
   <summary><b>How to aquire emission data</b></summary>
<br/>

1. Navigate to <a href="https://openghgmap.net/">OpenGHGmap</a> and wait until the data is loaded (coloring the base map)
2. Specify the search area by zooming in with the mouse wheel
3. Click on the three stripes to open the menue (upper right corner)
4. Click on Counties (lvl=6)
5. Hover over the region you want to see data from and write down the red value
6. Alternatively you can click on "About" on the right side and download the "allcountries.geojson.zip", but this is not required

</details>

> Example data is provided through <a href="https://heibox.uni-heidelberg.de/d/b6f83521a8ec4ee5b2f6/">heiBOX</a>. The emission value for Heidelberg is 472.689 t CO2/year (2018).

## How to run

<details>
   <summary><b>Part 1: Preperation</b></summary>
<br/>
    
1. Open the OSGeo4W Shell and navigate to the folder where the scripts are located (<a href="data_structure.png">data_structure.png</a>)
2. Execute the script "roi_extractor.bat"
3. You immediately are required to enter the roi. Any name of a city or town should work, for additional information you should look into the gadm36_DEU.gpkg and search under column "Name_3" for the exact name of your roi (try e.g. Heidelberg, Karlsruhe, Speyer or Gaggenau) - it has to be in the extent of the Sentinel-2 raster images!
5. The outlines of the roi are now saved as a shapefile in the "./data" folder

</details>

<details>
   <summary><b>Part 2: QGIS Model</b></summary>
<br/>

1. Open QGIS and navigate to the folder where the scripts are located (<a href="data_structure.png">data_structure.png</a>) and double-click on the model "TRNK_Model" to run it
3. Put in all required data:
    - CRS: leave the default setting (we recommend using EPSG:25832 in Germany)
    - the color definition file is "colors.txt" in your "./data" folder
    - the raster bands are the two from the "./data" folder with "B04" and "B08" in their names
    - the vector data input "roi" is the output from the script "roi_extractor.bat", so it should be the shapefile in the "./data" folder named as your input for your roi
    - it's not important where the output files are exported to, you just should find them easily afterwards (mind the recommendations)
4. Uncheck both check boxes
5. Run the model (takes up to 1 min depending on your PC)
6. It outputs one image and one Excel file at the locations you specified as output folders

</details>

<details>
   <summary><b>Part 3: Calculations in Excel</b></summary>
<br/>

1. Open the Excel file
2. Copy the values from the third column (no title)
3. Navigate to the folder where the scripts are located (<a href="data_structure.png">data_structure.png</a>) and open "TRNK_Excel.xls"
4. Paste the values in the column "HERE (m²)"
5. All following values should be automatically calculated
6. Now put in the emission value from <a href="https://openghgmap.net/">OpenGHGmap</a> in the marked cell under "Emission value (CO2/year)"
7. The result should be calculated and a message should be displayed whether the vegetation suffices to compensate the CO2 emissions of you roi.

> **Congratulations, you completed this analysis!**

</details>

---
## Literature:

NDVI and classification of NDVI-values:
- https://www.researchgate.net/publication/275030305_Evaluating_Multispectral_Images_and_Vegetation_Indices_for_Precision_Farming_Applications_from_UAV_Images
- https://www.earthobservatory.nasa.gov/features/MeasuringVegetation

Sequestation ability: Convert C in CO2:
- https://www.researchgate.net/publication/261699371_Sequestration_and_Carbon_Storage_Potential_of_Tropical_Forest_Reserve_and_Tree_Species_Located_within_Benue_State_of_Nigeria
- https://www.unm.edu/~jbrink/365/Documents/Calculating_tree_carbon.pdf
