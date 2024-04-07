#!/bin/sh

sed -i "s/;listen = 127.0.0.1:9000/listen = 127.0.0.1:9000/g" /etc/php81/php-fpm.d/www.conf

echo "[WORDPRESS] Waiting for MariaDB..."
while ! mariadb -h${DB_HOST} -u${MYSQL_USER} -p${MYSQL_PASS} ${MYSQL_DB} &>/dev/null;
do
    sleep 3
done
echo "[WORDPRESS] MariaDB accessible."

echo "[WORDPRESS] Creating users..."
wp config create --allow-root --dbname=${MYSQL_DB} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASS} --dbhost=mariadb:3306 --url=${DOMAIN} --force #--path=${WORDPRESS_PATH} --skip-check 
wp core install --allow-root --url=${DOMAIN} --title=${WORDPRESS_TITLE} --admin_user=${MYSQL_USER} --admin_password=${MYSQL_ROOT_PASS} --admin_email=${WORDPRESS_ADMIN_EMAIL}
wp user create ${WORDPRESS_USER} ${WORDPRESS_EMAIL} --user_pass=${WORDPRESS_PASS} --allow-root
wp option update home ${DOMAIN}
wp option update siteurl ${DOMAIN}
echo "[WORDPRESS] Set up ready!"

exec /usr/sbin/php-fpm81 -F -R