# Changelog of the project data folder

14.03.2022 v1.3.1 (?)
02.02.2022 v1.3 (?)
01.02.2022
29.01.2022
28.01.2022
26.01.2022 v1.0.0

## Version 1.3.1 (Hotfix)

Minor changes in the model:
- Changed the Raster Calculator back to SAGA RC and deactivated the QGIS RC (wasn't reliable - thanks for the info in the issues)
- Added a new comment to the QGIS RC
- Changed the position and size of some elements

## Version 1.3 (Major update)

Major changes in the model:
- Added a new preprocessing step: reprojection (warp) of the raster data so the model adapts to your needs even more

Minor changes in the model:
- Added a new comment to the QGIS RC
- Changed the position and size of some elements

## Version 1.2.2 (Hotfix)

Minor changes in the Spreadsheet:
- Changed the content of O7 to better show the calculation
- Changed the content of O11 and O12 to better show the differences

## Version 1.2.1 (Hotfix)

Minor changes in the model:
- Added some comments to the RCs to visualize differences
- Changed the position and size of some elements

## Version 1.2 (Major update)

Major changes in the model:
- Changed the SAGA RC to the QGIS RC
- Added other RCs for further testing (kept them deactivated)
- Added a box "Test other Raster Calculators"

Major changes in the Excelfile:
- Renamed the file into "Spreadsheet" - from now on it will be called this way

Minor changes in the model:
- Changed the position and size of some elements
- Changed the description of some elements

## Version 1.1.1 (Hotfix)

Minor changes in the model:
- Put the prestep into the box "Input"
- Changed the position of some elements

## Version 1.1 (Major update)

Major changes in the model:
- Transformed the roi_extractor.bat into a new prestep of the model (you don't need to use the OSGeo4W-Shell beforehand anymore yay! Also we can delete the bat-file)
- Added a matrix for the reclassification rules so you can change the classes on the fly (isn't recommended -> Spreadsheet)

Minor changes in the model:
- Added some descriptions to the prestep
- Changed the position and size of some elements to better implement the prestep

Minor changes in the Excelfile:
- Deleted line "no data"
- Changed the width of some columns
- Changed the position of some cells
- Changed the text 

## Version 1.0.2 (Hotfix)

- Added backgroud-boxes to clarify the different steps of the model (as mentioned in the presentation)

## Version 1.0.1 (Hotfix)

Minor changes in the model:
- Changed some descriptions
- Changed the position of some elements

## Version 1.0 (Release)

- Upload of the first fully functional version of the project including the QGIS model, the Excelfile, the color definition file and the region_extractor.bat!
