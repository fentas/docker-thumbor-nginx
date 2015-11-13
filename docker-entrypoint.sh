#!/bin/sh

envtpl /usr/src/app/thumbor.conf.tpl  --allow-missing --keep-template

if [ -z $1 ] || [ ${1:0:1} = '-' ]; then
  thumbor --port=80 --conf=/usr/src/app/thumbor.conf &
  set -- nginx -g 'daemon off;' "$@"
  cd /opt
fi

exec "$@"
