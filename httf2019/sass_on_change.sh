#!/bin/bash

#inotifywait -e close_write,moved_to,create -m scss |
fswatch scss |
while read -r directory events filename; do
	now=`date`
	printf "%s: Running SASS..." "$now"
	if sass scss/theme.scss &> css/theme.css; then
		printf "done\n"
		now=`date`
		printf "%s: Uploading CSS...\n" "$now"
		scp css/theme.css halfway-admin@halfway.wp.horizon.ac.uk:/var/www/halfway/public/theme/httf2019/css
	else
		printf "failed!\n"
	fi
done
