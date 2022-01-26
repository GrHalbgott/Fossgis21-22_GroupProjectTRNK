set roi=Heidelberg

ogr2ogr -f "ESRI Shapefile" ./data/%roi%.shp -lco ENCODING=UTF-8 -t_srs EPSG:25832 -sql "SELECT * FROM gadm36_DEU_3 WHERE NAME_3='%roi%'" ./data/gadm36_DEU.gpkg

gdalwarp -cutline ./data/%roi%.shp -crop_to_cutline -t_srs EPSG:25832 -dstnodata -9999 ./data/B04.jp2 ./data/%roi%_RED.tif

gdalwarp -cutline ./data/%roi%.shp -crop_to_cutline -t_srs EPSG:25832 -dstnodata -9999 ./data/B08.jp2 ./data/%roi%_NIR.tif