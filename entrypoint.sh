#!/bin/bash
set -e

if [[ -v ARTIFACTS_URL ]]; then
    mkdir /tmp/download
    echo "ARTIFACTS_URL: $ARTIFACTS_URL"

    #if [[ -v ARTIFACTS_HEADER ]]; then
	# Hack to add PRIVATE-TOKEN because cant set : in yaml file...
	#HEADER="--header "'"'PRIVATE-TOKEN: $ARTIFACTS_HEADER'"'
	#echo "ARTIFACTS_HEADER: $HEADER" 
    #fi

    curl --output /tmp/download/artifacts.tar.gz --header "PRIVATE-TOKEN: $ARTIFACTS_HEADER" -skw "\ntime_connect: %{time_connect}s\ntime_namelookup: %{time_namelookup}s\ntime_pretransfer: %{time_pretransfer}\ntime_starttransfer: %{time_starttransfer}s\ntime_redirect: %{time_redirect}s\ntime_total: %{time_total}s\n\n" -S "$ARTIFACTS_URL"
    echo "Download finished"
    tar -xzf /tmp/download/artifacts.tar.gz -C /usr/share/nginx/html
    rm -rf /tmp/download
    echo "Extract finished"
fi

exec "$@"
