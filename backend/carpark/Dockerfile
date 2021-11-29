FROM php:8.0-fpm-alpine

WORKDIR /var/www/html/

RUN php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer

COPY . .

RUN composer install && composer require doctrine/dbal

RUN set -ex \
  && apk --no-cache add \
    postgresql-dev
RUN docker-php-ext-install pdo pdo_pgsql
COPY ./custom-php.ini /etc/php/conf.d

RUN ["chmod", "+x", "run.sh"]  
ENTRYPOINT ["./run.sh"]
#RUN php -S 0.0.0.0:4001 -t public
