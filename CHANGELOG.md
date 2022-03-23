# Changelog of the project data folder

## 23.03.2022 - v1.1.3 (Hotfix)

Minor changes in the model:
- Changed the reclassification matrix back
- Changed the range boundaries to min <= value < max to optimize the reclassification

Minor changes in the Spreadsheet:
- Changed the descriptions of the levels of vegetation to be the same as in the reclassification matrix 

## 20.03.2022 - v1.1.2 (Hotfix)

Minor changes in the model:
- Changed the reclassification matrix to optimize the reclassification

Minor changes in the Spreadsheet:
- Changed the descriptions of the levels of vegetation to be the same as in the reclassification matrix 

## 14.03.2022 - v1.1.1 (Hotfix)

Minor changes in the model:
- Changed the Raster Calculator back to SAGA RC and deactivated the QGIS RC (wasn't reliable - thanks for the info in the issues)
- Added a new comment to the QGIS RC
- Changed the position and size of some elements

## 02.02.2022 - v1.1 (Major update)

Major changes in the model:
- Transformed the region_extractor.bat into a new prestep of the model (you don't need to use the OSGeo4W-Shell beforehand anymore yay! Also we can delete the bat-file)
- Added a new preprocessing step: reprojection (warp) of the raster data so the model adapts to your needs even more
- Changed the SAGA RC to the QGIS RC
- Added other RCs for further testing (kept them deactivated)

Minor changes in the model:
- Added a matrix for the reclassification rules so you can change the classes on the fly (isn't recommended -> Spreadsheet)
- Added some descriptions to the prestep
- Added some comments to the RCs to visualize differences
- Added backgroud-boxes to clarify the different steps of the model (as mentioned in the presentation)
- Changed the position and size of some elements to better implement the prestep

Minor changes in the Excelfile:
- Renamed the file into "Spreadsheet" - from now on it will be called this way
- Deleted line "no data"
- Changed the width of some columns
- Changed the position of some cells
- Changed the content of O7 to better show the calculation
- Changed the content of O11 and O12 to better show the differences

## 01.02.2022 - v1.0.4 (Reupload)

- Reupload without changes (changed structure of repository)

## 30.01.2022 - v1.0.3 (Reupload)

- Reupload without changes (changed structure of repository)

## 29.01.2022 - v1.0.2 (Hotfix)

Minor changes in the model:
- Renamed it into QGIS_Model

## 28.01.2022 - v1.0.1 (Hotfix & minor update)

Minor changes in the model:
- Added a tool to output a colored NDVI image
- Changed some descriptions
- Changed the position of some elements

## 26.01.2022 - v1.0 (Release)

- Upload of the first fully functional version of the project including the QGIS model, the Excelfile, the color definition file and the region_extractor.bat!
