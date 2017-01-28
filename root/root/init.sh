#!/bin/bash

if [ "x$WSHOST"="xauto" ]; then
	export WSHOST=`hostname -f`
fi

if [ -f "/config/goaccess.conf" ]; then
	rm /usr/local/etc/goaccess.conf
	ln -s /config/goaccess.conf /usr/local/etc/goaccess.conf
fi

if [ -f "/usr/local/etc/goaccess.conf" ] && [ ! -L "/usr/local/etc/goaccess.conf" ]; then
	mv /usr/local/etc/goaccess.conf /config/goaccess.conf
	ln -s /config/goaccess.conf /usr/local/etc/goaccess.conf
fi

if [ "x$FIXPERMISSIONS"="xtrue" ]; then
	chmod -R 0666 /config
	chmod -R 0666 /report
fi

/etc/periodic/weekly/libmaxminddb
goaccess -f "$LOGPATH/$LOGFILE" -o "$REPORTPATH/$REPORTFILE"

if [ "x$REALTIMEENABLED"="xtrue" ]; then
	goaccess -f "$LOGPATH/$LOGFILE" -o "$REPORTPATH/$REALTIMEREPORTFILE" --real-time-html --ws-url="wss://$WSHOST"
fi
