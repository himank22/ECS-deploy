FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y apache2 && \
    mkdir -p /var/run/apache2

WORKDIR /var/www/html

COPY index.html /var/www/html/

EXPOSE 80

ENV APACHE_RUN_DIR=/var/run/apache2

CMD ["apache2ctl", "-D", "FOREGROUND"]