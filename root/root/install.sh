#!/bin/sh
apk --no-cache add ca-certificates openssl tini curl bash sudo geoip ncurses libmaxminddb && update-ca-certificates

apk add --no-cache --virtual .build-deps \
    gcc \
	make \
	geoip-dev \
    freetype-dev \
	ncurses-dev \
    musl-dev
	
wget http://tar.goaccess.io/goaccess-1.1.1.tar.gz
tar -xzvf goaccess-1.1.1.tar.gz
cd goaccess-1.1.1/
./configure --enable-geoip --enable-utf8
make
make install

apk del .build-deps

ln -s /var/lib/libmaxminddb /usr/share/GeoIP/

# Database files to download
# MAXMINDDB_FILES="GeoIP.dat"
# Database download directory
# MAXMINDDB_URL="http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry"
# Local target directory
# MAXMINDDB_LIBDIR="/var/lib/libmaxminddb"
echo -e "MAXMINDDB_FILES=\"GeoIP.dat\"\nMAXMINDDB_URL=\"http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry\"" > /etc/conf.d/libmaxminddb
