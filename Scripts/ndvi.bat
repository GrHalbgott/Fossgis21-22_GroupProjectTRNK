gdal_calc.py -A ..\data\Sentinel_2\*B08.jp2 -B ..\data\Sentinel_2\*B04.jp2 --outfile=..\data\ndvi.tif --calc="(A - B)/(A + B)"
