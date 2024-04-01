#!/bin/sh

sed -i 's|MYSQL_DB|'${MYSQL_DB}'|g' /tmp/init.sql
sed -i 's|MYSQL_USER|'${MYSQL_USER}'|g' /tmp/init.sql
sed -i 's|MYSQL_PASS|'${MYSQL_PASS}'|g' /tmp/init.sql
sed -i 's|MYSQL_ROOT_PASS|'${MYSQL_ROOT_PASS}'|g' /tmp/init.sql
sed -i 's|MYSQL_PORT|'${MYSQL_PORT}'|g' /etc/mysql/my.cnf
sed -i 's|MYSQL_BIND_ADDRESS|'${MYSQL_BIND_ADDRESS}'|g' /etc/mysql/my.cnf

if [ -d "/var/lib/mysql/$MYSQL_DB" ]

then
  echo "Database already exists."
  mysqld_safe

else
  mysql_install_db
  mysqld --init-file="/tmp/init.sql"

fi

exec "$@"
