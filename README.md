## thumbor nginx

see https://github.com/APSL/docker-thumbor

#### Access restriction

`docker-compose` example
```yml
thumbor-upload:
  image: fentas/thumbor-nginx:latest
  stdin_open: true
  tty: true
  restart: always
  environment:
    MIN_WIDTH: 100
    MIN_HEIGHT: 100
    ALLOW_ANIMATED_GIFS: "True"
    STORAGE_EXPIRATION_SECONDS: 7776000 #90 days
    FILE_STORAGE_ROOT_PATH: "/data/storage"
    UPLOAD_MAX_SIZE: 10240 # 10MB
    UPLOAD_ENABLED: "True"
    UPLOAD_PUT_ALLOWED: "True"
    NGINX_RESTRICT: |
      satisfy: any;
      allow 88.198.23.1;
      allow 132.43.82.54;
      deny all;
      auth_basic "closed site";
      auth_basic_user_file htpasswd;
    NGINX_HTPASSWD: |
      foobar:$apr1$lODy4yH.$bzpAPiUdPYVShoJ602X341
  volumes:
    - /data/storage/:/data/storage/:rw
```
