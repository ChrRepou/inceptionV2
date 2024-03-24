FROM debian:buster

RUN apt update -yq
RUN apt upgrade -y
RUN apt-get install mariadb-server mariadb-client -y
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN chown -R mysql:mysql /etc/mysql/

COPY mariadb.cnf /etc/mysql
COPY create_database.sh /tmp/
COPY init_db.sql /tmp/

RUN chown -R mysql:mysql /tmp/
RUN chown -R mysql:mysql /etc/mysql

USER mysql

ENTRYPOINT ["sh", "/tmp/create_database.sh"]