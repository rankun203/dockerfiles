#!/usr/bin/env bash

echo 'mkdir app && chown -R www-data:www-data app && cd app'
mkdir app && chown -R www-data:www-data app && cd app

echo 'gosu www-data git clone https://code.keesee.net/nano/drupal-project.git .'
gosu www-data git clone https://code.keesee.net/nano/drupal-project.git .

echo 'gosu www-data composer install'
echo 'If installation is too slow, switch packagist first:\ncomposer config -g repo.packagist composer https://packagist.laravel-china.org'
gosu www-data composer install

echo 'Composer install successful...'

echo 'Start the server:'
echo ./vendor/bin/drupal rs 0.0.0.0:8080
