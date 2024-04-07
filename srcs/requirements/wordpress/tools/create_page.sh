#!/bin/sh

# Modify PHP-FPM configuration
sed -i "s/listen = 127.0.0.1:9000/listen = wordpress:9000/g" /etc/php81/php-fpm.d/www.conf

# Check if WordPress configuration exists
if [ ! -f "/var/www/html/wordpress/wp-config.php" ]; then
    echo "WordPress configuration not found. Proceeding with setup."

    echo "[WP config] Waiting for MariaDB..."
    while ! mariadb -h${DB_HOST} -u${MYSQL_USER} -p${MYSQL_PASS} ${MYSQL_DB} &>/dev/null;
    do
        sleep 3
    done
    echo "[WP config] MariaDB accessible."

    # Create WordPress configuration
    wp config create --allow-root --dbname=${MYSQL_DB} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASS} --dbhost=mariadb:3306 --url=${DOMAIN} --force #--path=${WORDPRESS_PATH} --skip-check 

    # Install WordPress
    wp core install --allow-root --url=${DOMAIN} --title=${WORDPRESS_TITLE} --admin_user=${MYSQL_USER} --admin_password=${MYSQL_ROOT_PASS} --admin_email=${WORDPRESS_ADMIN_EMAIL}

    # Create WordPress user
    wp user create ${WORDPRESS_USER} ${WORDPRESS_EMAIL} --user_pass=${WORDPRESS_PASS} --allow-root

    # Update WordPress options
    wp option update home ${DOMAIN}
    wp option update siteurl ${DOMAIN}

else
    echo "WordPress is already configured. Skipping setup."
fi

# Start PHP-FPM
exec /usr/sbin/php-fpm81 -F -R
