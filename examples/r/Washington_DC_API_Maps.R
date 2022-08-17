# https://rstudio.github.io/leaflet/showhide.html
# R studio - basic mapping of basemap, station locations, station lines


# .	Basemap - this is the 'general' map that people see, that extra information is usually plotted on top. A few ideas from the OpenData.DC.gov settings - which all should be using an GeoJSON (preferred) or a Geoservice:
#   o	https://opendata.dc.gov/datasets/3e65b5542eb1494ba63be31f334adafa_0
# o	https://opendata.dc.gov/datasets/basemap-of-dc-in-light-gray

# .	Station locations:
#   o	https://opendata.dc.gov/datasets/metro-stations-regional (both inside and outside of DC metro area)
# o	https://opendata.dc.gov/datasets/metro-stations-in-dc (inside DC metro area)

# .	Station lines:
#   o	https://opendata.dc.gov/datasets/metro-lines-regional (inside and outside of DC metro area)
# o	https://opendata.dc.gov/datasets/metro-lines (inside DC metro)

#installing readOGR to reading GeoJSONS
#install.packages("rgdal")
#install.packages("downloader")
#install.packages("leaflet")

library("rgdal")
#library("downloader")
library("leaflet")

#another thought: https://esri.github.io/esri-leaflet/api-reference/layers/basemap-layer.html

# https://leafletjs.com/examples/geojson/

#####################
# ROOT PATH
#create a root path to work with
root_pth <- paste0("C:/Users/",Sys.getenv("USERNAME"),"/Desktop/geospatial")
root_pth
setwd(root_pth)
getwd() #get working directory

######################

#basemap
bm <- rgdal::readOGR("https://maps2.dcgis.dc.gov/dcgis/rest/services/DCGIS_DATA/DC_Basemap_LightGray_WebMercator/MapServer/0/query?where=1%3D1&outFields=*&outSR=4326&f=json")
bm

#metro lines
metroLines <- rgdal::readOGR("https://opendata.arcgis.com/datasets/e3896b58a4e741d48ddcda03dae9d21b_51.geojson") 
metroLines
#%>% paste(collapse = "\n")

#read in the base map
leaflet(bm) %>%
  setView(lng = -77.035294, lat = 38.889605, zoom = 9) %>%
  addTiles()
