FROM debian:buster

RUN apt update -y
RUN apt upgrade -y

#install nginx
RUN apt install -y nginx openssl

#install openssl and create file to save the certificate will be generated
RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /run/nginx
RUN chown -R www-data /var/lib/nginx
RUN rm -rf /etc/nginx/sites-available/default

#change the current configuration file with ours
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/sites-available/default.conf
COPY ./tools/init.sh /tmp/init.sh

#create a link between those default.conf files
RUN     ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

EXPOSE 443

#run the script file
ENTRYPOINT [ "sh", "/tmp/init.sh" ]