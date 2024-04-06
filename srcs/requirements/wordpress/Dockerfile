FROM debian:buster

RUN apt update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-client php81 php81-common php81-curl php81-dom php81-exif php81-fileinfo \
        php81-fpm \
        php81-intl \
        php81-json \
        php81-mbstring \
        php81-mysqli \
        php81-openssl \
        php81-pecl-igbinary \
        php81-phar \
        php81-xml \
        php81-zip
#RUN apt-get install -y php php-mysql php-cli php-mbstring php-fpm php-gettext mariadb-client wget
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