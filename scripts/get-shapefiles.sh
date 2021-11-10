#!/bin/bash

set -o errexit -o nounset

cd "$(dirname "$0")" || exit
mkdir -p shp
cd shp || exit
if [ ! -s simplified-land-polygons-complete-3857.zip ] ; then
	echo "Downloading simplified-land-polygons-complete-3857.zip"
	curl --remote-time -L -o simplified-land-polygons-complete-3857.zip "https://osmdata.openstreetmap.de/download/simplified-land-polygons-complete-3857.zip"
fi
if [ ! -s land-polygons-split-3857.zip ] ; then
	echo "Downloading land-polygons-split-3857.zip"
	curl --remote-time -L -o land-polygons-split-3857.zip "https://osmdata.openstreetmap.de/download/land-polygons-split-3857.zip"
fi
if [ ! -s ne_10m_populated_places.zip ] ; then
	echo "Downloading ne_10m_populated_places.zip"
	curl --remote-time -L -o ne_10m_populated_places.zip "https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_populated_places.zip"
fi

if [ ! -s simplified-land-polygons-complete-3857/simplified_land_polygons.shp  ] ; then
	unzip simplified-land-polygons-complete-3857.zip
fi

if [ ! -s land-polygons-split-3857/land_polygons.shp ] ; then
	unzip land-polygons-split-3857.zip
fi

if [ ! -s ne_10m_populated_places.shp ] ; then
	unzip ne_10m_populated_places.zip
fi
