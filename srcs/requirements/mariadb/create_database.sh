#!/bin/sh

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]

then
  echo "Database already exists."
  mysqld_safe

else
  mysql_install_db
  mysqld --init-file="/tmp/init_db.sql"

fi

exec "$@"
