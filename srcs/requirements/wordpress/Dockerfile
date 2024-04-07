FROM debian:buster

RUN apt update -y
RUN apt-get update && apt-get install -y \
    mariadb-client \
    php8.1 \
    php8.1-common \
    php8.1-curl \
    php8.1-dom \
    php8.1-exif \
    php8.1-fileinfo \
    php8.1-fpm \
    php8.1-intl \
    php8.1-json \
    php8.1-mbstring \
    php8.1-mysql \
    php8.1-opcache \
    php8.1-phar \
    php8.1-xml \
    php8.1-zip
#RUN rm -rf /etc/php/7.3/fpm/pool.d/www.conf
#RUN mkdir -p /run/php

#COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
WORKDIR /var/www/wordpress
RUN wget \
	https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp core download --path=${WORDPRESS_PATH} --allow-root
COPY ./tools/create_page.sh /tmp/

RUN chmod +x /tmp/create_page.sh

EXPOSE 9000

ENTRYPOINT [ "sh", "/tmp/create_page.sh" ]