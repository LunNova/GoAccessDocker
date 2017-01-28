#!/bin/bash
cd /out/

if [ "x$WSHOST" eq "xauto" ]; then
	export WSHOST=`hostname -f`
fi

goaccess -f "$LOGPATH/$LOGFILE" -o "$REPORTPATH/$REPORTFILE" --real-time-html --ws-url="$WSHOST"
