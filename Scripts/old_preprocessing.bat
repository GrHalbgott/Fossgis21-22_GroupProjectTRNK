cd C:\Users\Tobi\Desktop\Groupproject
::Vektor 
ogr2ogr -t_srs EPSG:4326 Proj-Heidelberg.shp Heidelberg.shp 
::Raster: 
::Convert .jp2 to tif
gdal_translate Heidelberg.jp2 c:\data\sentinel.tif
gdalwarp -t_srs EPSG:4326 Heidelberg.tif Heidelbergproj.tif –overwrite  
::Clippen
::create a RGBA dataset from RGB dataset with a mask 
gdal_translate withmask.tif rgba.tif -b 2 -b 3 -b 4 -b mask 
gdalwarp -t_srs EPSG:4326 -Heidelbergproj.shp -crop_to_cutline -dstnodata -9999 -dstalpha sentinel.tif sentinelcrop.tif  


