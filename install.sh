#!/bin/bash

current_dir=$(pwd)
current_date=$(date +%Y%m%d)

for dotfile in \.*; do

  # Only consider files that are of type file.
  if [ -f $dotfile ]; then

	  dest_file=~/$dotfile

	  # Backup destination file if it already exists.
	  if [ -f $dest_file ]; then
      $backup_dest_file=$dest_file.bak.$current_date
	    mv $dest_file $backup_dest_file
      echo "$dest_file already exists. Backing it up to $backup_dest_file"
	  fi

	  # Symlink destination file --> source file.
	  ln -s $current_dir/$dotfile ~/$dotfile

  fi

done
