.PHONY: *

PHP_VERSION := "8.2"

php-image:
	docker build --tag ordinary-php-image --build-arg PHP_VERSION=$(PHP_VERSION) .

versions:
	docker run --rm -v ${PWD}:/opt/project -w /opt/project ordinary-php-image php --version
	docker run --rm -v ${PWD}:/opt/project -w /opt/project ordinary-php-image composer --version

validate-deps:
	docker run --rm -v ${PWD}:/opt/project -w /opt/project ordinary-php-image composer validate --strict

test:
	docker run --rm -v ${PWD}:/opt/project -w /opt/project ordinary-php-image composer run-script test

deps:
	docker run --rm -v ${PWD}:/opt/project -w /opt/project ordinary-php-image composer install --no-progress
