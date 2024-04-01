#!/bin/sh

WORDPRESS_DIR="/var/lib/docker/volumes/wordpress/_data"

if [ -f "$WORDPRESS_DIR/wp-config.php" ]; then
  echo "WordPress is already configured."
else
  # Your existing setup commands here
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /usr/local/bin/wp
  wp core download --path="$WORDPRESS_DIR" --allow-root
  wp config create --dbname=wordpress --dbuser=crepou --dbpass=pass --dbhost=mariadb --path="$WORDPRESS_DIR" --skip-check --allow-root
  wp core install --path="$WORDPRESS_DIR" --url=crepou.42.fr --title=Inception --admin_user=ChristinaRepou --admin_password=ChristinaRepou --admin_email=@student.42heilbronn.de --skip-email --allow-root
  wp theme install teluro --path="$WORDPRESS_DIR" --activate --allow-root
  wp user create leon leon@le.on --role=author --path="$WORDPRESS_DIR" --user_pass=leon --allow-root
fi

/usr/sbin/php-fpm7.3 -F
