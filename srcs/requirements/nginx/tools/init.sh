#!/bin/sh

#create file for the wordpress data
mkdir -p $WORDPRESS_PATH
chown -R www-data $WORDPRESS_PATH

#generate a certificate
openssl req -x509 -nodes -days 365 \
-subj "/C=DE/ST=Baden-Württemberg/L=Heilbronn/O=42/OU=42/CN='${DOMAIN}'/UID='${MYSQL_USER}'" -newkey rsa:2048 \
-keyout $CERTS_KEY -out $CERTS_CRT

sed -i 's|DOMAIN|'${DOMAIN}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|WORDPRESS_PATH|'${WORDPRESS_PATH}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|PHP_HOST|'${PHP_HOST}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|PHP_PORT|'${PHP_PORT}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|CERTS_KEY|'${CERTS_KEY}'|g' /etc/nginx/sites-available/default.conf
sed -i 's|CERTS_CRT|'${CERTS_CRT}'|g' /etc/nginx/sites-available/default.conf

#run container in the foreground
nginx -g "daemon off;"
