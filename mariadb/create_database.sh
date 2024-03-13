service mysql start;
mysql -e "CREATE DATABASE IF NOT EXISTS \`${db_name}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${db_username}\`@'localhost' IDENTIFIED BY '${db_password}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${db_name}\`.* TO \`${db_username}\`@'%' IDENTIFIED BY '${db_password}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${db_root_password}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$db_root_password shutdown
exec mysqld_safe