echo Enter the region of interest (roi): 
set /p roi=

ogr2ogr -f "ESRI Shapefile" ./data/%roi%.shp -lco ENCODING=UTF-8 -t_srs EPSG:25832 -sql "SELECT * FROM gadm36_DEU_3 WHERE NAME_3='%roi%'" ./data/gadm36_DEU.gpkg