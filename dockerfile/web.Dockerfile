FROM php:7.2-apache

COPY ./file-web /var/www/html

RUN docker-php-ext-install pdo pdo_mysql

HEALTHCHECK CMD curl -f http://localhost/ || exit 1
