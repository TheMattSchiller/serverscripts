#!/bin/bash

target_server=munki2-apache1-2b-west-us

target_directory="~/munki"

target_user="ubuntu"

local_directory="/home/ubuntu/munki/"

log_location="/home/ubuntu/scripts/lastsync.log.txt"

if  [ ! -e "$log_location" ]; then
	touch "$log_location"
fi

echo "Syncing munki repo now..."
echo
echo

rsync -av --delete "$local_directory" "$target_user"@"$target_server":"$target_directory" | tee "$log_location"
exit 0
