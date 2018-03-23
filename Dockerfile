FROM arieslaluces/ubuntu-16-apache-php-5.6
RUN a2enmod rewrite
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/log/supervisor
COPY emrs.conf /etc/apache2/conf-enabled
COPY emrs/ /var/www/html/emrs/
RUN sed -i -e "s/YOUR_IP_ADDRESS/$(curl ifconfig.co)/g" /var/www/html/emrs/templates/base.html 
RUN sed -i -e "s/YOUR_IP_ADDRESS/$(curl ifconfig.co)/g" /var/www/html/emrs/index.html 
RUN cd /var/www/html/emrs/ ; composer install
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
