FROM debian:buster

RUN apt update

#install nginx
RUN apt install nginx -y

#install openssl and generate a certifiaction
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/germany_certificate.crt -keyout /etc/nginx/ssl/germany_private.key -subj "/C=DE/ST=Baden-Württemberg/L=Heilbronn/O=42/OU=42/CN=crepou.42.fr/UID=crepou"

#create a file to save nginx conf files
RUN mkdir -p /var/run/nginx

#change the current configuration file with ours
COPY nginx.conf /etc/nginx/nginx.conf

#give permission to root and main user
RUN chmod 755 /var/www/html 
RUN chown -R www-data:www-data /var/www/html

#run container in the foreground
CMD [ "nginx", "-g", "daemon off;" ]