#!/bin/sh

envtpl /usr/src/app/thumbor.conf.tpl  --allow-missing --keep-template

if [ -z $1 ] || [ ${1:0:1} = '-' ]; then
  if [ ! -z "${NGINX_RESTRICT}" ]; then
    printf "${NGINX_RESTRICT}" > /etc/nginx/includes/nginx-restrict
  fi
  if [ ! -z "${NGINX_HTPASSWD}" ]; then
    printf "${NGINX_HTPASSWD}" > /etc/nginx/htpasswd
  fi
  thumbor --port=80 --conf=/usr/src/app/thumbor.conf &
  set -- nginx -g 'daemon off;' "$@"
  cd /opt
fi

exec "$@"
