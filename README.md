# Plants versus CO<sub>2</sub>

### Classification, Calculation and Comparison: <br/> *Does the vegetation of a specific region suffice to compensate the CO<sub>2</sub> emissions of this exact region?*

## General information

For a specific point in time we would like to determine the vegetation areas in a region of interest (roi) and compare them with CO<sub>2</sub> emission values to find out whether they are sufficient enough to compensate those emissions. The project should serve to correlate CO<sub>2</sub> emissions of a roi with its vegetation areas and to be able to make statements about the climate balance. Through automation, different regions should be able to be examined easily. It should be pointed out that all values are estimated and not to be taken as scientifically proven.

## Software requirements and Installation

### Programs (we used):
- QGIS Desktop 3.22
- with the following Plugins:
    - SAGA 7.8.2-14
    - GRASS GIS 7.8.6-7 [optional for comparison]
> Those programs and plugins are all are included in the OSGeo4W-Package
- Microsoft Excel (any Spreadsheet with basic calculation tools will do)

### How to install

#### GIS (Windows):
1. Download the OSGeo4W Installer from <a href="https://trac.osgeo.org/osgeo4w/">here</a> (right-click on "OSGeo4W network installer" -> "Save linked content as...")
2. Run the installer
3. Select Advanced Install, click through the steps and keep the default values
4. Stop at "Choose packages": select the following packages for installation. Click on "Skip" in the column "New" to select a package for installation. If a package is selected for installation, the version number will be shown in the column "New". You can search for their names in the searchbar.
5. Under the section "Desktop" choose:
```
    qgis: QGIS Desktop (3.22)
    saga: SAGA (7.8.2-14)
    grass: GRASS GIS (7.8.6-8) [optional]
```
6. Under the section "Libs" choose:
```
    qgis-grass-plugin: GRASS plugin for QGIS (3.22.3-1) [optional] 
```
> Note: Additional packages which are needed to run the ones listed above will be selected automatically. Just keep those as well.
8. Complete the installation

#### GIS (iOS/Linux) will follow soon

#### Spreadsheet (Windows/iOS/Linux):
You should already have a spreadsheet program installed. 
If not, feel free to choose whichever you like and install it accordingly.

## Required data

- Multispectral raster data of Heidelberg: Sentinel 2 data (https://scihub.copernicus.eu/dhus/#/home), it's available free and has a resolution of 10m in the needed bands red and NIR 
- Vector data of Heidelberg: GADM data by country (https://gadm.org/download_country.html), it's available free, is structured in different administrative levels and comes with interesting additional data
- Emission (CO<sub>2</sub>) data: OpenGHGMap (https://openghgmap.net/), it's available free, outputs one total emission value per city/region and shows the different sources of emission
- Sequestration ability of vegetation: values from literature 

### Aquisition of the required data

> First step: download the file `project_data.zip` and extract the files into a folder (choose a name). This is called the `project folder` in the following steps. The folder `data` in it is referred to as `./data`. <br/>
> Take a look at <a href="Examples, help and additional info/Data structure.png">Data structure</a> for reference:

<details>
   <summary><b>Data structure</b></summary>
<br/>
  <img src="Examples, help and additional info/Data structure.png"></img>
  
</details>  

<details>
   <summary><b>How to aquire vector data</b></summary>
<br/>

1. Navigate to <a href="https://gadm.org/download_country.html">GADM data by country</a>, select any country you want and download the Shapefile
2. When downloaded, unzip the ZIP-file into a folder (e.g. `gadm40_DEU` for Germany) and move the whole folder to the folder `./data`

</details>    
    
<details>
   <summary><b>How to aquire raster (Sentinel 2) data</b></summary>
<br/>
    
1. Navigate to <a href="https://scihub.copernicus.eu/dhus/#/self-registration">Copernicus Open Access Hub by ESA registration form</a> and set up an account
2. Log in on <a href="https://scihub.copernicus.eu/dhus/#/home">Copernicus Open Access Hub</a>. Without logging in you cannot download the required data
3. Specify the search area in the map with right-click (move map with left-click and zoom in with mouse wheel)
4. Click on the three stripes left of the search box to open the advanced search (upper left corner of screen)
5. Select Sentinel 2 and put following statement in the box for the cloud cover: `[0 TO 10]`
6. If you want to search for data in a specific time period, put the required dates in "sensing period" (we recommend using the year 2018 because the emission data is from this year only)
7. Click on the search button (upper right of search box) and wait until the results are displayed
8. Search for an image with full extent (no black parts) and minimal cloud cover
9. Hover over the entry and click on the eye icon ("View product details") which appears along with other icons on the lower right side of the entry
10. Check in the quick look window if the data seems suitable
<br/><br/>
    > If the images you are looking for are offline, take a look at <a href="https://github.com/GrHalbgott/Plants-vs-CO2/wiki/Troubleshooting">troubleshooting - Sentinel 2 data offline</a> for some help on that problem.
11. In the Inspector, navigate to `GRANULE/*Name of data*/IMG_DATA/R10m/` and download the two files "...B04..." & "...B08..." (both .jp2)
12. When downloaded, put the two files in the `./data` folder
</details>

<details>
   <summary><b>How to aquire emission data</b></summary>
<br/>

1. Navigate to <a href="https://openghgmap.net/">OpenGHGmap</a> and wait until the data is loaded (coloring the base map)
2. Specify the search area by zooming in with the mouse wheel and moving the map with left-click
3. Hover over the region you want to see data from and you'll get a red value which shows the total CO<sub>2</sub> emissions in tonnes for the year 2018
4. For convenience you can already put the value in the "Excelsheet.xlsx" which can be found inside the `project_data.zip` in the marked cell beneath "Emission value (t CO<sub>2</sub>/year)" (blue background). This will be a step at "Part 2: Calculations" (see below) as well

</details>

> Example data is provided through <a href="https://heibox.uni-heidelberg.de/d/0213462b883847edbf5b/">heiBOX</a>. The emission value for Heidelberg is 472.689 t CO<sub>2</sub>/year (2018).

## How to run

<details>
   <summary><b>Part 1: QGIS Model</b></summary>
<br/>

1. Open QGIS, navigate to the `project folder` and double-click on the model "QGIS_Model" to run it
3. Put in all required data:
    - Column name depends on the admin level of your roi. Every country has different admin levels and so you have to specify which column of the according shapefile (gadm) you want to use to search for your roi. For cities in Germany, leave the default setting (more info under <a href="https://github.com/GrHalbgott/Plants-vs-CO2/wiki/Troubleshooting">troubleshooting - extracting the roi</a>)
    - CRS: specify in which ccordinate reference system you want to project your data. For analyses in Germany, leave the default setting
    - The color definition file is "colors.txt" in your `./data` folder (more info under <a href="https://github.com/GrHalbgott/Plants-vs-CO2/wiki/Specifics">specifics - coloring</a>)
    - GADM shapefile is the .shp-file in your gadm folder with the according number as specified under "Column name" (more info under <a href="https://github.com/GrHalbgott/Plants-vs-CO2/wiki/Specifics">specifics - reigon of interest</a>)
    - Name of your roi is the region you want to analyse. Any name of a city or town should work, as long as you specify the right admin level. It has to be in the extent of the Sentinel 2 raster images!
    - The raster bands are the two from the `./data` folder with "B04" and "B08" in their names (the right order is very important!)
    - Reclassification matrix is the table with information on how the tool shall reclassify (more info under <a href="https://github.com/GrHalbgott/Plants-vs-CO2/wiki/Specifics">specifics - reclassification</a>) - leave the default setting
    - The next two parts are the outputs: it's not important where the output files are exported to, you just should find them easily afterwards (we recommend using the project data folder and naming both output or results)
4. Uncheck both check boxes
5. Run the model
6. It outputs one image and one Excel file at the locations you specified as output folders
<br/><br/>
    > If you need help with running the model, check the files inside the folder <a href="Examples, help and additional info/">Examples, help and additional info</a> 
7. Take a look at the image and compare it to <a href="Examples, help and additional info/NDVI colored.png">NDVI colored</a> - does it makes sense? You should see your roi colored from red to green on a white background
8. Proceed if it looks fine, repeat the steps if something seems wrong. Remember to check your input values in the model! Additional help can be found in our <a href="https://github.com/GrHalbgott/Plants-vs-CO2/wiki/">wiki</a>. If you cannot resolve the problem yourself feel free to ask questions in the <a href="https://github.com/GrHalbgott/Fossgis22_Plants-vs-CO2/issues">Issues</a> section of this repository

</details>

<details>
   <summary><b>Part 2: Calculations in Excel</b></summary>
<br/>

1. Open the spreadsheet file you got from the model as output 
2. Copy the values from the third column (no title)
3. Navigate to the project folder and open "Excelsheet.xls"
4. Paste the values in the column "HERE (m²)" (blue background)
5. Now put in the emission value from <a href="https://openghgmap.net/">OpenGHGmap</a> in the marked cell under "Emission value (t CO<sub>2</sub>/year)" (blue background) if you did not already
6. All following values including the result should be automatically calculated
7. The result is displayed through a color in the corresponding cells. It states whether the vegetation suffices to compensate the CO<sub>2</sub> emissions of your roi or not

### Congratulations, you completed this analysis!

</details>

### *Footnote:*

For further information on the model and the specific calculations you can look into <a href="https://github.com/GrHalbgott/Plants-vs-CO2/wiki/Specifics">specifics</a>. If you have any questions or encounter a specific problem, feel free to use the <a href="https://github.com/GrHalbgott/Fossgis22_Plants-vs-CO2/issues">Issues</a> section of this repository to get in touch with us. We are looking forward to your ideas and input!

---

## Literature:

Aryal, J./Sitaula, C./Aryal, S. (2022): NDVI Threshold-Based Urban Green Space Mapping from Sentinel-2A at the Local Governmental Area (LGA) Level of Victoria, Australia. - In: Land, 11:351, n.p. <br/>
Candiago, S./Remondino, F./De Giglio, M./Dubbini. M./Gattelli, M.(2015): Evaluating Multispectral Images and Vegetation Indices for Precision Farming Applications from UAV Images. - In: Remote Sensing, 7, pp. 4026 - 4047. <br/>
Churkina, G. (2016): The Role of Urbanization in the Global Carbon Cycle. - In: Frontiers in Ecology and Evolution, 3:144, n.p. <br/>
Da Silva, V.S./Salami, G./Oliveira da Silva, M.I./Araujo Silva, E./Montiero, J.J./Alba, E. (2020): Methodological evaluation of vegetation indexes in land use and land cover (LULC) classification. - In: Geology, Ecology and Landscapes, 4(2), n.p. <br/>
Davies, Z.G./Edmondson, J.L./Heinemeyer, A./Leake, J.R./Gaston, K.J. (2011): Mapping an urban ecosystem service: quantifyingabove-ground carbon storage at a city-wide scale. - In: Journal of Applied Ecology, 48, pp. 1125-1134. <br/>
El-Gammal, M.I./Ali, R.R./Abou Samra, R.M. (2014): NDVI Threshold Classification for Detecting Vegetation Cover in Damietta Governorate, Egypt. - In: Journal of American Science, 10(8), pp. 108-113. <br/>
Eneji, I.S./Obinna, O./Azua, E.T. (2013): Sequestration and Carbon Storage Potential of Tropical Forest Reserve and Tree Species Located within Benue State of Nigeria. - In: Journal of Geoscience and Environment Protection, 2, pp. 157-166. <br/>
IPCC [Intergovernmental Panel on Climate Change] (2015): Climate Change 2014. Synthesis Report. Geneva, Switzerland. <br/>
Hashim, H./Latif, Z.A./Adnan, N.A. (2019): Urban Vegetation Classification with NDVI Threshold Value Method with Very High Resolution (VHR) Pleiades Imagery. - In: The International Archives of the Photogrammetry, Remote Sensing and Spatial Information Sciences, 42(4), pp. 237-240. <br/>
Mkansi, R. (2017): Spectral reflectance of soil, vegetation and water. - URL: https://mkansireminder.wordpress.com/2017/04/24/spectral-reflectance-of-soil-vegetation-water/ [28.07.2021]. <br/>
Osterburg, B./Don, a. (2021): Nur die langfristige CO2-Bindung zählt. - In: Panorama Klimaschutz, DLG-Mitteilungen, 5, pp. 64-66. <br/>
Tang, Y./Chen, A./Zhao, S. (2016): Carbon Storage and Sequestration of Urban Street Trees in Beijing, China. - In: Froniers in Ecology and Evolution, 4:53, n.p. <br/>
Weier, J./Herring, D. (2000): Measuring Vegetation (NDVI & EVI). - URL: https://earthobservatory.nasa.gov/features/MeasuringVegetation [16.03.2022]. <br/>

Additional sequestration ability values/convert C in CO<sub>2</sub> formula:
- https://www.unm.edu/~jbrink/365/Documents/Calculating_tree_carbon.pdf
- https://www.co2-acker.de/
