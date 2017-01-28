#!/bin/bash

if [ "x$WSHOST"="xauto" ]; then
	export WSHOST=`hostname -f`
fi

if [ -f "/config/goaccess.conf" ]; then
	rm /usr/local/etc/goaccess.conf
	ln -s /config/goaccess.conf /usr/local/etc/goaccess.conf
fi

if [ -f "/usr/local/etc/goaccess.conf" ] && [! -L "/usr/local/etc/goaccess.conf" ]; then
	mv /usr/local/etc/goaccess.conf /config/goaccess.conf
	ln -s /config/goaccess.conf /usr/local/etc/goaccess.conf
fi

/etc/periodic/weekly/libmaxminddb
goaccess -f "$LOGPATH/$LOGFILE" -o "$REPORTPATH/$REPORTFILE" --real-time-html --ws-url="$WSHOST"
