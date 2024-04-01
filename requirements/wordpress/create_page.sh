#!/bin/sh

if [ -f "/var/www/wordpress/wp-config.php" ]

then
  echo "Wordpress is already confiured."
else
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
  wp core download --path=/var/www/wordpress --allow-root
  wp config create --dbname=wordpress --dbuser=crepou --dbpass=pass --dbhost=mariadb --path=/var/www/wordpress --skip-check --allow-root
  wp core install --path=/var/www/wordpress --url=crepou.42.fr --title=Inception --admin_user=ChristinaRepou --admin_password=ChristinaRepou --admin_email=crepou@student.42heilbronn.de --skip-email --allow-root
  wp theme install teluro --path=/var/www/wordpress --activate --allow-root
  wp user create leon leon@le.on --role=author --path=/var/www/wordpress --user_pass=leon --allow-root

fi

/usr/sbin/php-fpm7.3 -F
