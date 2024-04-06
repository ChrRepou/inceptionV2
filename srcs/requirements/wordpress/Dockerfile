FROM debian:buster

RUN apt update -y
RUN apt-get upgrade -y
RUN apt-get install -y php php-mysql php-cli php-mbstring php-fpm php-gettext mariadb-client wget
RUN rm -rf /etc/php/7.3/fpm/pool.d/www.conf
RUN mkdir -p /run/php

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/create_page.sh /tmp/

RUN chmod +x /tmp/create_page.sh

EXPOSE 9000

ENTRYPOINT [ "sh", "/tmp/create_page.sh" ]