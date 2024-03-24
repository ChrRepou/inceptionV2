#!/bin/sh

#create file for the wordpress data
mkdir -p /var/www/wordpress
chown -R www-data /var/www/wordpress

#generate a certificate
openssl req -x509 -nodes \
-out /etc/nginx/ssl/inception.crt \
-keyout /etc/nginx/ssl/inception.key \
-subj "/C=DE/ST=Baden-Württemberg/L=Heilbronn/O=42/OU=42/CN=crepou.42.fr/UID=crepou"

#run container in the foreground
nginx -g "daemon off;"