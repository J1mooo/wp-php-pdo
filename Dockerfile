FROM wordpress:php7.4-apache

RUN docker-php-ext-install pdo pdo_mysql

COPY ./upload.ini /usr/local/etc/php/conf.d
