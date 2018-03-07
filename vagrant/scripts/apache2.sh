#!/usr/bin/env bash

. /lib/lsb/init-functions

log_begin_msg "Installing web servers"
sudo apt-get install -y apache2 > /dev/null 2>&1
sudo service apache2 stop > /dev/null 2>&1
log_end_msg 0

log_begin_msg "Generate ssl certs for apache"
if [ ! -d "/vagrant/etc/apache2/conf/" ]; then
sudo mkdir /vagrant/etc/apache2/conf/
  if [ ! -d "/vagrant/etc/apache2/conf/ssl/" ]; then
  sudo mkdir /vagrant/etc/apache2/conf/ssl/
  fi
fi

if [ ! -f "/vagrant/etc/apache2/conf/ssl/yii2-test.loc.crt" ]; then
    if [ ! -f "/vagrant/etc/apache2/conf/ssl/yii2-test.loc.key" ]; then
        sudo openssl req -new -newkey rsa:1024 -nodes -keyout /vagrant/etc/apache2/conf/ssl/yii2-test.loc.key -x509 -days 500 -subj /C=RU/ST=Grodno/L=Grodno/O=Companyname/OU=User/CN=fuel-3d.loc/emailAddress=admin@fuel-3d.loc -out /vagrant/etc/apache2/conf/ssl/yii2-test.loc.crt > /dev/null 2>&1
    fi
fi
log_end_msg 0