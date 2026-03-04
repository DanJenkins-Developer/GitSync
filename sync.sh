#!/bin/sh

LOGFILE=$2

SYNC_DIR=$1

cd $SYNC_DIR



while inotifywait -qr --event modify . >> "$LOGFILE" 2>&1; do 
	
	sleep 30;
	
	echo "--- Sync started at $(date) ---" >> "$LOGFILE"

	git pull >> "$LOGFILE" 2>&1
	git add . >> "$LOGFILE" 2>&1
	git commit -m "sync" >> "$LOGFILE" 2>&1
	git push origin main >> "$LOGFILE" 2>&1

	echo "--- Sync complete ---" >> "$LOGFILE"

done 
