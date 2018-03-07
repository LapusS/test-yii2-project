#!/usr/bin/env bash

. /lib/lsb/init-functions

log_begin_msg "Installing Mailcatcher"
sudo apt-get install -y ruby-dev sqlite3 libsqlite3-dev > /dev/null 2>&1
sudo gem install bundler > /dev/null 2>&1
sudo gem install eventmachine -v 1.0.3 > /dev/null 2>&1
sudo gem install mime-types -v 2.99.1 > /dev/null 2>&1
sudo gem install mailcatcher -v 0.5.12 > /dev/null 2>&1
log_end_msg 0

