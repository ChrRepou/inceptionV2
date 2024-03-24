FROM debian:buster

RUN apt update -y \
    && apt upgrade -y \
    && apt-get install -y wget php7.3 php-fpm php-mysql mariadb-client unzip \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://wordpress.org/latest.zip -P /var/www \
    && cd /var/www && unzip latest.zip && rm latest.zip

RUN chown -R root:root /var/www/wordpress

COPY wp-config-sample.php /var/www/wordpress/wp-config.php
COPY create_page.sh /

CMD [ "/create_page.sh" ]