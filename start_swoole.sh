#!/bin/bash

# 以www-data用户运行swoole重启命令
su -s /bin/bash -c 'cd /var/www/chat.13aq.com && /usr/bin/php7.4 think swoole restart' www-data