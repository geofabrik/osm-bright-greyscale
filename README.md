# OSM Bright

![screenshot](./preview.png)

OSM Bright is a sensible starting point for quickly making beautiful maps based on an OpenStreetMap database. It is written in the [Carto](https://github.com/kosmtik/kosmtik) styling language and can be opened as a project in [Kosmtik](https://github.com/kosmtik/kosmtik)

Versions will be tagged with the [osm-carto](https://github.com/gravitystorm/openstreetmap-carto) version that is supported.

## Installation

### Shapefiles

	./scripts/get-shapefiles.sh

Optionally pass `--dry-run` to not perform anything, merely print out what would be done.

### OpenStreetMap data

Follow [openstreetmap-carto installation instructions](https://github.com/gravitystorm/openstreetmap-carto/blob/master/INSTALL.md#openstreetmap-data)

## Viewing with Kosmtik

Install kosmtik:

	npm install kosmtik

This command displays the map on [http://127.0.0.1:6789/osm-bright/](http://127.0.0.1:6789/osm-bright/)

	./node_modules/kosmtik/index.js serve ./project.mml

## History

This style was originally developed by [Mapbox](https://github.com/mapbox/osm-bright) between 2012 → 2016.

In late 2021, [Geofabrik](https://www.geofabrik.de/) patched it to simplify the installation, and make it work with the latest [openstreetmap-carto database](https://github.com/gravitystorm/openstreetmap-carto) installed with [osm2pgsql](https://osm2pgsql.org/).

This style is no longer being actively maintained.

See [LICENSE.txt](./LICENSE.txt) for copyright licence.
