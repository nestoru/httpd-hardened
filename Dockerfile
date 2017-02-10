FROM ubuntu:16.04 

MAINTAINER Nestor Urquiza <nestor.urquiza@gmail.com>


RUN apt-get update -y
RUN apt-get install -y apache2 iputils-ping

COPY 000-default.conf /etc/apache2/sites-available/
COPY default-ssl.conf /etc/apache2/sites-available/
RUN a2ensite default-ssl
RUN a2enmod ssl rewrite proxy proxy_http lbmethod_bybusyness expires

RUN usermod -u 1000 www-data

EXPOSE 80 443
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
