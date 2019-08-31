#!/bin/bash

fswatch scss |
while read -r directory events filename; do
	now=`date`
	printf "%s: Running SASS..." "$now"
	if sass scss/theme.scss &> css/theme.css; then
		printf "done\n"
		now=`date`
		printf "%s: Minifying CSS...\n" "$now"
		uglifycss css/theme.css > css/theme.min.css
		now=`date`
		printf "%s: Uploading CSS...\n" "$now"
		scp css/theme.* halfway@norma.porcheron.cloud:/www/httf/public/theme/httf/css
		#scp css/theme.* halfway-admin@halfway.wp.horizon.ac.uk:/var/www/halfway/public/theme/httf/css
	else
		printf "failed!\n"
	fi
done
