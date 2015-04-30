#!/bin/bash

DATADIR="/var/lib/ces/scm"
if [ ! -d "$DATADIR" ]; then
  btrfs subvolume create "$DATADIR"
  mkdir "$DATADIR/data"
  chown -R 1000:1000 "$DATADIR"
  chmod -R 755 "$DATADIR"
fi

docker rm scm
docker create \
  --name scm \
  -h scm \
  -v /etc/ces:/etc/ces \
  -v "$DATADIR/data":/var/lib/scm \
  cesi/scm