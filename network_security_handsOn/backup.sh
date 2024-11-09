#!/bin/bash

SOURCE_DIRECTROY="/var/ftp/pub/"
BACKUP_DIRECTORY="/var/backups/ftp/"
FILENAME=backup-ftp-$(date +%Y%m%d)-$(date +%H%M).tar.bz2
tar --create --bzip2 --file=$BACKUP_DIRECTORY$FILENAME $SOURCE_DIRECTROY
