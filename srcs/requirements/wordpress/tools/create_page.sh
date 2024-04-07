#!/bin/sh

#sed -i 's|PHP_PORT|'${PHP_PORT}'|g' /etc/php/7.3/fpm/pool.d/www.conf
sed -i "s/listen = 127.0.0.1:9000/listen = 9000/g" /etc/php81/php-fpm.d/www.conf

  #wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  #chmod +x wp-cli.phar
  #mv wp-cli.phar /usr/local/bin/wp
  #wp core download --path=${WORDPRESS_PATH} --allow-root
  sleep 60
  wp config create --allow-root --dbname=${MYSQL_DB} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASS} --dbhost=mariadb:3306 --url=${DOMAIN} --force #--path=${WORDPRESS_PATH} --skip-check 
  wp core install --allow-root --url=${DOMAIN} --title=${WORDPRESS_TITLE} --admin_user=${WORDPRESS_USER} --admin_password=${WORDPRESS_PASS} --admin_email=${WORDPRESS_EMAIL}
  wp user create ${WORDPRESS_USER} ${WORDPRESS_USER_EMAIL} --user_pass=${WORDPRESS_USER_PASS} --allow-root
  wp option update home ${DOMAIN}
  wp option update siteurl ${DOMAIN}


php-fpm81 -F
