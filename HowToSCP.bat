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
