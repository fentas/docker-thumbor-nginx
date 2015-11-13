#!/bin/sh

envtpl /usr/src/app/thumbor.conf.tpl  --allow-missing --keep-template

if [ -z $1 ] || [ ${1:0:1} = '-' ]; then
  if [ ! -z "${NGINX_RESTRICT}" ]; then
    echo ${NGINX_RESTRICT} > /etc/nginx/includes/nginx-restrict
  fi
  thumbor --port=80 --conf=/usr/src/app/thumbor.conf &
  set -- nginx -g 'daemon off;' "$@"
  cd /opt
fi

exec "$@"
