# Docker Images

[![Build Status](https://travis-ci.org/kreait/docker-images.svg?branch=master)](https://travis-ci.org/kreait/docker-images)
[![Discord](https://img.shields.io/discord/523866370778333184.svg?color=7289da&logo=discord)](https://discord.gg/p4W55UM)

## PHP

Docker images built on top of Alpine Linux with the latest stable PHP Version and common and useful extensions.

The images are automatically re-built and published on a weekly basis.

## Available tags and information

| Image  | Size |
| --- | --- |
| kreait/php:7.3          | [![](https://images.microbadger.com/badges/image/kreait/php:7.3.svg)](https://microbadger.com/images/kreait/php:7.3) |
| kreait/php:7.3-dev      | [![](https://images.microbadger.com/badges/image/kreait/php:7.3-dev.svg)](https://microbadger.com/images/kreait/php:7.3-dev) |
| kreait/php:7.3-fpm      | [![](https://images.microbadger.com/badges/image/kreait/php:7.3-fpm.svg)](https://microbadger.com/images/kreait/php:7.3-fpm) |
| kreait/php:7.3-fpm-dev  | [![](https://images.microbadger.com/badges/image/kreait/php:7.3-fpm-dev.svg)](https://microbadger.com/images/kreait/php:7.3-fpm-dev) |
| kreait/php:7.4          | [![](https://images.microbadger.com/badges/image/kreait/php:7.4.svg)](https://microbadger.com/images/kreait/php:7.4) |
| kreait/php:7.4-dev      | [![](https://images.microbadger.com/badges/image/kreait/php:7.4-dev.svg)](https://microbadger.com/images/kreait/php:7.4-dev) |
| kreait/php:7.4-fpm      | [![](https://images.microbadger.com/badges/image/kreait/php:7.4-fpm.svg)](https://microbadger.com/images/kreait/php:7.4-fpm) |
| kreait/php:7.4-fpm-dev  | [![](https://images.microbadger.com/badges/image/kreait/php:7.4-fpm-dev.svg)](https://microbadger.com/images/kreait/php:7.4-fpm-dev) |

## Docker Security

All the images are pre-built with a user `www-data` and a group with the same name. Generally there is no need to run containers with `root` privileges, so we advise the following:

**Specify a --user name and set the working directory on docker runs, e.g.:**

```bash
docker run --user www-data -w /home/www-data --rm kreait/php:7.3-dev bash -c "php -v | grep 'Xdebug'"
```

Confirm it by running:

```bash
docker run --user www-data -w /home/www-data --rm kreait/php:7.3-dev bash -c "id ; env" 
```
