#!/bin/sh

sed -i 's|PHP_PORT|'${PHP_PORT}'|g' /etc/php/7.3/fpm/pool.d/www.conf

if [ -f "/var/www/html/wordpress/wp-config.php" ]

then
  echo "Wordpress already configured."
else
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
  wp core download --path=${WORDPRESS_PATH} --allow-root
  wp config create --dbname=${MYSQL_DB} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASS} --dbhost=mariadb --path=${WORDPRESS_PATH} --skip-check --allow-root
  wp core install --path=${WORDPRESS_PATH} --url=${DOMAIN} --title=${WORDPRESS_TITLE} --admin_user=${WORDPRESS_USER} --admin_password=${WORDPRESS_PASS} --admin_email=${WORDPRESS_EMAIL} --skip-email --allow-root
  wp theme install teluro --path=${WORDPRESS_PATH} --activate --allow-root
  wp user create leon leon@le.on --role=author --path=${WORDPRESS_PATH} --user_pass=leon --allow-root

fi

/usr/sbin/php-fpm7.3 -F
