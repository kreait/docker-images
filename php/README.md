# Docker PHP Images

[![Build Status](https://travis-ci.org/kreait/docker-images.svg?branch=master)](https://travis-ci.org/kreait/docker-images)

Docker images built on top of [Alpine 3.6](https://hub.docker.com/r/_/alpine/)
with the latest stable PHP Version (7.1) and common and useful extensions.

## Available tags and `Dockerfile` links

- [`7` (php/7/Dockerfile)](https://github.com/kreait/docker-images/blob/master/php/7/Dockerfile)
- [`7-dev` (php/7-dev/Dockerfile)](https://github.com/kreait/docker-images/blob/master/php/7-dev/Dockerfile)
- [`7-fpm` (php/7-fpm/Dockerfile)](https://github.com/kreait/docker-images/blob/master/php/7-fpm/Dockerfile)
- [`7-fpm-dev` (php/7-fpm-dev/Dockerfile)](https://github.com/kreait/docker-images/blob/master/php/7-fpm-dev/Dockerfile)

## Installed PHP packages

All images share the PHP packages listed in 
[`php/scripts/install-packages.sh`](https://github.com/kreait/docker-images/blob/master/php/scripts/install-packages.sh).

The `*-fpm` images include the `php7-fpm` package.

The `*-dev` images include the `php7-phpdbg` and `php7-xdebug` packages.

## Image additions

As it is very likely that PHP is used in combination with a webserver, all images include a
`www-data` user (UID 82, GID 82).
