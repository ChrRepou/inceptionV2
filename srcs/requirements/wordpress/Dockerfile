FROM alpine:3.18

RUN apk update && apk add mariadb-client \
php81 \
php81-common \
php81-curl \
php81-dom \
php81-exif \
php81-fileinfo \
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
WORKDIR /var/www/wordpress
RUN wget \
	https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN wp core download --path=${WORDPRESS_PATH} --allow-root
COPY ./tools/create_page.sh /tmp/

RUN chmod +x /tmp/create_page.sh

EXPOSE 9000

ENTRYPOINT ["/tmp/create_page.sh" ]