# Troubleshooting

In this file we want to give you some help to troubleshoot problems on your own. Some problems will be more common than others, so before you despair and try too long on your own, please use the  <a href="https://github.com/GrHalbgott/Fossgis22_Plants-vs-CO2/discussions">Discussions</a> section of this repository so we can try to help you. Maybe others even had the same problems and got an answer already?

<details>
  <summary>Sentinel 2 data offline</summary>
<br/>
  
If the images you are looking for are offline, you can add them to your cart. Go to your cart (upper left next to the three stripes) and click on download (hover over entry and click on the download icon). It should say that downloading offline products is not possible. At this time, there should appear a clock icon next to the "Offline" text which says either "pending" or "running". Click on the same download button again and it should state that the offline product retrieval is initiated. At this point you did everything the right way. If you encouter problems try again following the manual in the <a href="https://github.com/GrHalbgott/Fossgis22_Plants-vs-CO2/">ReadMe</a>  or use the <a href="https://github.com/GrHalbgott/Fossgis22_Plants-vs-CO2/discussions">Discussions</a> section to ask us for aid wth aquiring the data.
After a while (up to one hour) the datasets will be available to download for three consecutive days. Proceed to the next steps in the <a href="https://github.com/GrHalbgott/Fossgis22_Plants-vs-CO2/">ReadMe</a> to download finally the data.

</details>

<details>
  <summary>Extracting the region of interest</summary>
<br/>

If you have problems with extracting your roi from the shapefiles one possible solution could be to change some options in the model:
  
1. Take a look at the shapefiles in your folder from <a href="gadm.org/country">gadm.org</a>. There are different administrative levels and they are different in every country. The highest number usually has the lowest admin level (like towns) and includes all other admin levels as well. It makes sense if you think about it: every smaller/lower admin level is included in a larger/higher admin level.
2. If you want to extract a roi from one of the shapefiles, you have to look exactly which shapefile you would need. A city in Germany for example can be found in level 3 and a town in level 4. A Landkreis/larger region can be found in level 3 but also in level 4, because all smaller towns are included in that region. So it strongly depends on the admin level which shapefile you would need. We recommend using the shapefile with the highest number (can be quite large).
3. If you know which shapefile you need and it is not level 3, change the input parameter "Column name" to the number you need.
4. If that also doesn't work look closely how the roi is written in the shapefile - maybe it has special characters in it? We recommend to copy paste the value from the shapefile into the model as the input parameter for "Name of your roi"
5. And if that also doesn't work feel free to ask us on the <a href="https://github.com/GrHalbgott/Fossgis22_Plants-vs-CO2/discussions">Discussions</a> section of this repository so we can help you to get the model to run. We would be glad to help you!
  
</details>
