#!/bin/bash

# create directory to use in nginx container later and also to set up the WordPress conf
mkdir /var/www/
mkdir /var/www/html

cd /var/www/html

# Remove existing content (if any)
rm -rf *

# Install WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar 
mv wp-cli.phar /usr/local/bin/wp

# WordPress Core Download and Configuration
wp core download --allow-root

# Substitute environment variables in wp-config.php using COPY in Dockerfile
# No need for sed commands in the script

# WordPress Installation
wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

# Creating a User
wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

# Theme and Plugin Installation --install another
wp theme install astra --activate --allow-root
wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root

# PHP-FPM Configuration
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
mkdir /run/php

# Enabling Redis Cache for WordPress
wp redis enable --allow-root

# Start PHP-FPM
/usr/sbin/php-fpm7.3 -F
