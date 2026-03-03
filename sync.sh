#!/bin/sh

LOGFILE=""

cd .



while inotifywait -qr --event modify . >> "$LOGFILE" 2>&1; do 
	sleep 30;
	
	cd .


	echo "--- Sync started at $(date) ---" >> "$LOGFILE"

	git add . >> "$LOGFILE" 2>&1
	git commit -m "sync" >> "$LOGFILE" 2>&1
	git push origin main >> "$LOGFILE" 2>&1

	echo "--- Sync complete ---" >> "$LOGFILE"


done 
