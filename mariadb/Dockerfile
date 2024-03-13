FROM debian:buster

RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y

COPY mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY create_database.sh /

CMD ["/create_database.sh"]