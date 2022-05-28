#!/bin/bash
#author https://github.com/developeranaz (don't delete this)
#refreshing Rclone
rclone version
#serving to port 8080
mkdir /myconfig
mkdir /serviceaccount
mkdir /cachefolder
curl -L $RCLONE_CONFIG_IN_RAW_URL >/myconfig/rclone.conf
curl -L $RCLONE_SERVICE_ACCOUNT >/serviceaccount/account.json
rclone serve webdav "Crypt:" --config "/myconfig/rclone.conf" --addr :$PORT --vfs-cache-mode full --buffer-size 96M --vfs-read-ahead 192M --drive-chunk-size 512M --vfs-cache-max-size 200G --vfs-cache-max-age 24h --cache-dir "/cachefolder/" --dir-cache-time 1000h --poll-interval 15s --timeout 1h --use-mmap