# Docker PHP Images

Docker images built on top of [Alpine 3.6](https://hub.docker.com/r/_/alpine/) with the latest stable PHP Version (7.1) and common and useful extensions.

The build is automated, so that the images should always be up-to-date with the Dockerfiles in the [GitHub repository](https://github.com/kreait/docker-images).

## Available tags and information

| Tag  | Dockerfile |Size |
| --- | --- | --- |
| 7  | [php/7/Dockerfile](https://github.com/kreait/docker-images/blob/master/php/7/Dockerfile) | [![](https://images.microbadger.com/badges/image/kreait/php:7.svg)](https://microbadger.com/images/kreait/php:7) |
| 7-dev  | [php/7-dev/Dockerfile](https://github.com/kreait/docker-images/blob/master/php/7-dev/Dockerfile) | [![](https://images.microbadger.com/badges/image/kreait/php:7-dev.svg)](https://microbadger.com/images/kreait/php:7-dev) |
| 7-fpm  | [php/7-fpm/Dockerfile](https://github.com/kreait/docker-images/blob/master/php/7-fpm/Dockerfile) | [![](https://images.microbadger.com/badges/image/kreait/php:7-fpm.svg)](https://microbadger.com/images/kreait/php:7-fpm) |
| 7-fpm-dev  | [php/7-fpm-dev/Dockerfile](https://github.com/kreait/docker-images/blob/master/php/7-fpm-dev/Dockerfile) | [![](https://images.microbadger.com/badges/image/kreait/php:7-fpm-dev.svg)](https://microbadger.com/images/kreait/php:7-fpm-dev) |

## Installed PHP packages

All images share the PHP packages listed in 
[`php/scripts/install-packages.sh`](https://github.com/kreait/docker-images/blob/master/php/scripts/install-packages.sh).

The `*-fpm` images include the `php7-fpm` package.

The `*-dev` images include the `php7-phpdbg` and `php7-xdebug` packages.

## Image additions

As it is very likely that PHP is used in combination with a webserver, all images include a
`www-data` user (UID 82, GID 82 - 82 is the standard uid/gid for `www-data` in Alpine).
