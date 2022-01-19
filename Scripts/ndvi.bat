gdal_calc.py -A ..\data\Sentinel_2\B08.tif -B ..\data\Sentinel_2\B04.tif --outfile=..\data\ndvi.tif --calc="(A - B)/(A + B)"
