#!/usr/bin/env bash
# Daily local backup of OpenGym JSON data. Media is excluded (re-downloadable).
set -euo pipefail
SRC=/opt/opengym/data
DEST=/opt/opengym/backups
STAMP=$(date +%Y-%m-%d)
mkdir -p "$DEST"
tar -czf "$DEST/opengym-data-$STAMP.tar.gz" -C /opt/opengym data
find "$DEST" -name 'opengym-data-*.tar.gz' -mtime +14 -delete
