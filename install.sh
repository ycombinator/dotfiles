#!/bin/bash

current_dir=$(pwd)
current_date=$(date +%Y%m%d)

for config_file in \.*; do

    # Only consider configuration files that are of type file.
    if [ -f $config_file ]; then

	src_file=$current_dir/config_file
	dest_file=~/$config_file

	# Backup destination file if it already exists.
	if [ -f $dest_file ]; then
	    mv $dest_file $dest_file.bak.$current_date
	fi

	# Symlink destination file --> source file.
	ln -s $current_dir/$config_file ~/$config_file

    fi

done