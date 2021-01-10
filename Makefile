.PHONY: all

DOCKER_RUN_TEST_OPTIONS = --user www-data -w /home/www-data --rm

all: php test-php

.PHONY: php
php:
	docker build --build-arg ALPINE_VERSION=3.11 --build-arg VCS_REF=`git rev-parse --short HEAD` --target php -t kreait/php:7.3 -f php/Dockerfile php
	docker build --build-arg ALPINE_VERSION=3.11 --build-arg VCS_REF=`git rev-parse --short HEAD` --target php-dev -t kreait/php:7.3-dev -f php/Dockerfile php
	docker build --build-arg ALPINE_VERSION=3.11 --build-arg VCS_REF=`git rev-parse --short HEAD` --target php-fpm -t kreait/php:7.3-fpm -f php/Dockerfile php
	docker build --build-arg ALPINE_VERSION=3.11 --build-arg VCS_REF=`git rev-parse --short HEAD` --target php-fpm-dev -t kreait/php:7.3-fpm-dev -f php/Dockerfile php

	docker build --build-arg ALPINE_VERSION=edge --build-arg VCS_REF=`git rev-parse --short HEAD` --target php -t kreait/php:7.4 -f php/Dockerfile php
	docker build --build-arg ALPINE_VERSION=edge --build-arg VCS_REF=`git rev-parse --short HEAD` --target php-dev -t kreait/php:7.4-dev -f php/Dockerfile php
	docker build --build-arg ALPINE_VERSION=edge --build-arg VCS_REF=`git rev-parse --short HEAD` --target php-fpm -t kreait/php:7.4-fpm -f php/Dockerfile php
	docker build --build-arg ALPINE_VERSION=edge --build-arg VCS_REF=`git rev-parse --short HEAD` --target php-fpm-dev -t kreait/php:7.4-fpm-dev -f php/Dockerfile php

.PHONY: test-php
test-php:
	docker container run $(DOCKER_RUN_TEST_OPTIONS) kreait/php:7.3 bash -c "php -v | grep '7\.3'"
	docker container run $(DOCKER_RUN_TEST_OPTIONS) kreait/php:7.3-dev bash -c "php -v | grep '7\.3'"
	docker container run $(DOCKER_RUN_TEST_OPTIONS) kreait/php:7.3-fpm bash -c "php -v | grep '7\.3'"
	docker container run $(DOCKER_RUN_TEST_OPTIONS) kreait/php:7.3-fpm-dev bash -c "php -v | grep '7\.3'"

	docker container run $(DOCKER_RUN_TEST_OPTIONS) kreait/php:7.4 bash -c "php -v | grep '7\.4'"
	docker container run $(DOCKER_RUN_TEST_OPTIONS) kreait/php:7.4-dev bash -c "php -v | grep '7\.4'"
	docker container run $(DOCKER_RUN_TEST_OPTIONS) kreait/php:7.4-fpm bash -c "php -v | grep '7\.4'"
	docker container run $(DOCKER_RUN_TEST_OPTIONS) kreait/php:7.4-fpm-dev bash -c "php -v | grep '7\.4'"

	docker container run $(DOCKER_RUN_TEST_OPTIONS) kreait/php:7.3-dev bash -c "php -v | grep 'Xdebug'"
	docker container run $(DOCKER_RUN_TEST_OPTIONS) kreait/php:7.3-fpm-dev bash -c "php -v | grep 'Xdebug'"
	docker container run $(DOCKER_RUN_TEST_OPTIONS) kreait/php:7.4-dev bash -c "php -v | grep 'Xdebug'"
	docker container run $(DOCKER_RUN_TEST_OPTIONS) kreait/php:7.4-fpm-dev bash -c "php -v | grep 'Xdebug'"

.PHONY: deploy
deploy:
	docker push kreait/php:7.3
	docker push kreait/php:7.3-dev
	docker push kreait/php:7.3-fpm
	docker push kreait/php:7.3-fpm-dev

	docker push kreait/php:7.4
	docker push kreait/php:7.4-dev
	docker push kreait/php:7.4-fpm
	docker push kreait/php:7.4-fpm-dev

.PHONY: clean
clean:
	docker image ls -q kreait/php | xargs docker rmi -f
