echo Enter the region of interest (roi): 
set /p roi=

ogr2ogr -f "ESRI Shapefile" ./data/%roi%.shp -lco ENCODING=UTF-8 -t_srs EPSG:25832 -sql "SELECT * FROM gadm36_DEU_3 WHERE NAME_3='%roi%'" ./data/gadm36_DEU.gpkg

::This script enables you to input a name for a region of interest (roi).
::It uses the specified name of your roi to search in the vector layer "gadm36_DEU_3" of the geopackage "gadm36_DEU.gpkg" for an attribute.
::With sql, it selects any attribute from gadm36_DEU_3 where "NAME_3" is your specified roi.
::It then exports this selection as [yourspecifiedroiname].shp with the crs EPSG:25832.