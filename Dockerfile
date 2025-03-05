FROM php:8.3.14-apache

RUN apt-get update
RUN apt-get install --yes --force-yes cron g++ gettext openssl libcurl4-openssl-dev

RUN a2enmod rewrite

RUN docker-php-ext-install mysqli
RUN docker-php-ext-enable mysqli

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
RUN sed -i "s/session.gc_maxlifetime = 1440/session.gc_maxlifetime = 7200/g" /usr/local/etc/php/php.ini
RUN sed -i "s/session.cookie_lifetime = 0/session.cookie_lifetime = 7200/g" /usr/local/etc/php/php.ini
