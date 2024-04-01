FROM debian:buster

RUN apt-get update -yq
RUN apt-get upgrade -y
RUN apt-get install mariadb-server mariadb-client -y
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld
RUN chown -R mysql:mysql /etc/mysql/

COPY ./conf/mariadb.cnf /etc/mysql
COPY ./tools/create_database.sh /tmp/
COPY ./conf/init.sql /tmp/

RUN chown -R mysql:mysql /tmp/
RUN chown -R mysql:mysql /etc/mysql

EXPOSE 3306

USER mysql

ENTRYPOINT ["sh", "/tmp/create_database.sh"]