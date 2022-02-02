# Specifics of the model and other interesting information

<details>
  <summary>Calculation of NDVI</summary>
<br/>

  The formula for the NDVI we calculated with is (A-B)/(A+B). A and B are the clipped and reprojected bands of the Sentinel 2 dataset accordingly.

</details>

<details>
  <summary>Calculations in Excel</summary>
<br/>
  
Input values are the frequency of pixels in a class (like "class 3 = 600.000" means that there are as many pixels having a value inside this class). Because of the homegenic spatial resolution of Sentinel 2 each pixel is 10x10m in size, therefore if you multiply the frequency with 10 you get m<sup>2</sup>. Divide that number by 10.000 and you get hectares, which is better to calculate the sequestration ability with.

</details>

<details>
  <summary>Reclassification matrix</summary>
<br/>

| Value range | Assigned class | Represents |
| ----- | ----- | ----- |
| -1.1 - 0.2 | 1 | no vegetation |
| 0.2 - 0.4 | 2 | low level of vegetation (shrub/grass) |
| 0.4 - 0.6 | 3 | medium level of vegetation (crops) |
| 0.6 - 1 | 4 | high level of vegetation (forest) |

Note: we include values from -1.1, because there are some error values slightly smaller than -1 which we want to include in class 1. Furthermore we want to leave the NoDate value of -9999 as it is and not include it, because the coloring works with this value as well (take a look at the coloring chapter).
  
</details>

<details>
  <summary>Coloring</summary>
<br/>

This is the content of the color definition file:

```
{
-9999 255 255 255 0 <br/>
1 215 25 28 100 <br/>
2 255 255 120 100 <br/>
4 26 150 65 100 <br/>
}
```

It is usually structured as "elevation (value), red, green, blue, alpha" because it is used to color digital elevation models. We use the color-relief for coloring classes instead (which have specific values). The NoData value (-9999) is additionally included to always paint the background white (looks nicer and helps checking if everything went right).
The option "use smoothly blended colors" enables interpolation of colors between the specified values/classes - if you have more classes, this looks way better. In our case it's not important, but we include it anyways just to have it in case.
  
</details>

## Troubleshooting:

<details>
  <summary>Region of interest</summary>
<br/>

If you have problems with extracting your roi from the shapefiles one possible solution could be to change some options in the model:
  
1. Take a look at the shapefiles in your folder from <a href="gadm.org/country">gadm.org</a>. There are different administrative levels and they are different in every country. The highest number usually has the lowest admin level (like towns) and includes all other admin levels as well. It makes sense if you think about it: every smaller/lower admin level is included in a larger/higher admin level.
2. If you want to extract a roi from one of the shapefiles, you have to look exactly which shapefile you would need. A city in Germany for example can be found in level 3 and a town in level 4. A Landkreis/larger region can be found in level 3 but also in level 4, because all smaller towns are included in that region. So it strongly depends on the admin level which shapefile you would need. We recommend using the shapefile with the highest number (can be quite large).
3. If you know which shapefile you need and it is not level 3, change the input parameter "Column name" to the number you need.
4. If that also doesn't work look closely how the roi is written in the shapefile - maybe it has special characters in it? We recommend to copy paste the value from the shapefile into the model as the input parameter for "Name of your roi"
5. And if that also doesn't work feel free to ask us on the <a href="https://github.com/GrHalbgott/Fossgis22_Plants-vs-CO2/discussions">Discussions</a> section of this repository so we can help you to get the model to run. We would be glad to help you!
  
</details>
