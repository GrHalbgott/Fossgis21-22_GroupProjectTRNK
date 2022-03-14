# Changelog for the QGIS model 

## Version 1.3.0 (Major update)

Major changes:
- Added a new preprocessing step: reprojection (warp) of the raster data so the model adapts to your needs even more
- Changed the Raster Calculator back to SAGA RC and deactivated the QGIS RC (wasn't reliable - thanks for the info in the issues)

Minor changes:
- Added a new comment to the QGIS RC
- Changed the position and size of some elements

## Version 1.2.1 (Hotfix)

Minor changes:
- Added some comments to the RCs to visualize some differences

## Version 1.2.0 (Major update)

Major changes:
- Changed the SAGA RC to the QGIS RC
- Added other RCs for further testing (kept them deactivated)
- Added a box "Test other Raster Calculators"

Minor changes:
- Changed the position and size of some elements
- Changed the description of some elements

## Version 1.1.1 (Hotfix)

Minor changes:
- Put the prestep into the box "Input"
- Changed the position of some elements

## Version 1.1.0 (Major update)

Major changes:
- Transformed the roi_extractor.bat into a new prestep of the model (you don't need to use the OSGeo4W-Shell beforehand anymore yay! Also we can delete a bat-file)
- Added a matrix for the reclassification rules (so we can delete one txt-file)

Additional minor changes:
- Added some descriptions to the prestep
- Changed the position and size of some elements to better implement the prestep

## Version 1.0.2 (Hotfix)

- Added backgroud-boxes to clarify the different steps of the model (as mentioned in the presentation)

## Version 1.0.1 (Hotfix)

Minor changes:
- Changed some descriptions
- Changed the position of some elements

## Version 1.0.0 (Release)

- Upload of the first fully functional version of the QGIS model!
