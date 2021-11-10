#!/bin/bash

WET_RUN=true
if [ $# -gt 1 ] && [ "$1" = "--dry-run" ] ; then
	WET_RUN=false
fi

set -o errexit -o nounset

CURL_VERSION=$(curl --version | head -n 1 | cut -d" " -f2)

function curl_req() {
	curl -v -A "osm-bright-get-shapefiles/1.0 curl/${CURL_VERSION}" --fail --remote-time -L "$@"
}

cd "$(dirname "$0")/.." || exit
mkdir -p shp
cd shp || exit
if [ ! -s simplified-land-polygons-complete-3857.zip ] ; then
	echo "Downloading simplified-land-polygons-complete-3857.zip"
	if $WET_RUN ; then
		curl_req -o simplified-land-polygons-complete-3857.zip "https://osmdata.openstreetmap.de/download/simplified-land-polygons-complete-3857.zip"
	fi
fi
if [ ! -s land-polygons-split-3857.zip ] ; then
	echo "Downloading land-polygons-split-3857.zip"
	if $WET_RUN ; then
		curl_req -o land-polygons-split-3857.zip "https://osmdata.openstreetmap.de/download/land-polygons-split-3857.zip"
	fi
fi
if [ ! -s ne_10m_populated_places.zip ] ; then
	echo "Downloading ne_10m_populated_places.zip"
	if $WET_RUN ; then
		curl_req -o ne_10m_populated_places.zip "https://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_populated_places.zip"
	fi
fi

if [ ! -s simplified-land-polygons-complete-3857/simplified_land_polygons.shp  ] ; then
	echo "Unzipping simplified-land-polygons-complete-3857.zip"
	if $WET_RUN ; then
		unzip simplified-land-polygons-complete-3857.zip
		shapeindex simplified-land-polygons-complete-3857/simplified_land_polygons.shp
	fi
fi

if [ ! -s land-polygons-split-3857/land_polygons.shp ] ; then
	echo "Unziping land-polygons-split-3857.zip"
	if $WET_RUN ; then
		unzip land-polygons-split-3857.zip
		shapeindex land-polygons-split-3857/land_polygons.shp
	fi
fi

if [ ! -s ne_10m_populated_places.shp ] ; then
	echo "Unzip ne_10m_populated_places.zip"
	if $WET_RUN ; then
		unzip ne_10m_populated_places.zip
		shapeindex ne_10m_populated_places.shp
	fi
fi
