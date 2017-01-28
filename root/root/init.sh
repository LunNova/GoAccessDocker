#!/bin/bash

if [ "x$WSHOST" -eq "xauto" ]; then
	export WSHOST=`hostname -f`
fi

/etc/periodic/weekly/libmaxminddb
goaccess -f "$LOGPATH/$LOGFILE" -o "$REPORTPATH/$REPORTFILE" --real-time-html --ws-url="$WSHOST"
