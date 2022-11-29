#!/bin/bash

# This is for Google Cloud Console

# Remove all PHP packages
sudo apt remove -y php*

# Install Apache2 and PHP 7.4
sudo apt install -y apache2 php7.4 libapache2-mod-php7.4 php7.4-gd php7.4-curl php7.4-zip 

# Set the ServerName directive in apache2.conf to the web host name
sudo sed -i "1i ServerName 8080-$WEB_HOST" /etc/apache2/apache2.conf

# Change the port from 80 to 8080
sudo sed -i 's/Listen 80/Listen 8080/g' /etc/apache2/ports.conf

# Change the user and group to the current user
sudo sed -i "s/\${APACHE_RUN_USER}/$USER/g" /etc/apache2/apache2.conf
sudo sed -i "s/\${APACHE_RUN_GROUP}/$USER/g" /etc/apache2/apache2.conf

# Change the ownership of the web directory to the current user
sudo chown -R $USER:$USER /var/www

# Start the Apache2 service and download and install OpenCart
sudo service apache2 start
cd `mktemp -d`
wget 


