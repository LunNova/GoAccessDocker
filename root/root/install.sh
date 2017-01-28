#!/bin/sh
apk --no-cache add ca-certificates openssl tini curl bash sudo geoip ncurses && update-ca-certificates

apk add --no-cache --virtual .build-deps \
    gcc \
	make \
	geoip-dev \
    freetype-dev \
	ncurses-dev \
    musl-dev

ln -s /config/goaccess.conf /usr/local/etc/goaccess.conf
	
wget http://tar.goaccess.io/goaccess-1.1.1.tar.gz
tar -xzvf goaccess-1.1.1.tar.gz
cd goaccess-1.1.1/
./configure --enable-geoip --enable-utf8
make
make install

apk del .build-deps