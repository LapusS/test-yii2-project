#!/usr/bin/env bash

. /lib/lsb/init-functions

log_begin_msg "Installing PHP"
sudo apt-get install -y curl php5-cli php5-intl php5-curl php5-xdebug php5-mcrypt php5-gd php-gettext php-pear libapache2-mod-php5 > /dev/null 2>&1
sudo chmod 666 /etc/php5/apache2/php.ini > /dev/null 2>&1
sudo echo "xdebug.default_enable = On" >> /etc/php5/apache2/php.ini
sudo echo "xdebug.remote_enable = On" >> /etc/php5/apache2/php.ini
sudo echo "xdebug.remote_host = 192.168.56.1" >> /etc/php5/apache2/php.ini
sudo echo "xdebug.remote_port = 9000" >> /etc/php5/apache2/php.ini
sudo echo "xdebug.remote_handler = dbgp" >> /etc/php5/apache2/php.ini
sudo service apache2 stop > /dev/null 2>&1
log_end_msg 0