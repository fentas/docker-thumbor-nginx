## thumbor nginx

see https://github.com/APSL/docker-thumbor

#### Access restriction

`docker-compose` example
```yml
thumbor-upload:
  image: thumbor-nginx:latest
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
      allow 88.198.116.119;
      allow 148.251.54.238;
      allow 148.251.82.54;
      deny all;
  volumes:
    - /data/storage/:/data/storage/:rw
```
