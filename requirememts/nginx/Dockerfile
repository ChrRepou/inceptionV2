FROM debian:buster

RUN apt update -y
RUN apt upgrade -y

#install nginx
RUN apt install nginx -y

#install openssl and create file to save the certificate will be generated
RUN apt install openssl -y
RUN mkdir -p /etc/nginx/ssl
RUN mkdir -p /run/nginx
RUN chown -R www-data /var/lib/nginx
RUN rm -rf /etc/nginx/sites-available/default

#change the current configuration file with ours
COPY nginx.conf /etc/nginx/nginx.conf
COPY def.conf /etc/nginx/sites-available/default.conf
COPY init.sh /tmp/init.sh

#create a link between those default.conf files
RUN     ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

EXPOSE 443

#run the script file
ENTRYPOINT [ "sh", "/tmp/init.sh" ]